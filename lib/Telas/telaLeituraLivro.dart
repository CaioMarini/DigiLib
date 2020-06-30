import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

// Change this to fit the PDF file you are using to test.
String urlPDFPath = "";
String pdf = "";
bool downloadControl = false;
void main() => runApp(OpenBooks());

class OpenBooks extends StatefulWidget {
  @override
  _OpenBooksState createState() => _OpenBooksState();
}

class _OpenBooksState extends State<OpenBooks> {
  @override
  Widget build(BuildContext context) {
    pdf = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DigLib',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This moves the PDF file from the assets to a place accessible by our PDF viewer.

  @override
  void initState() {
    super.initState();
    getFileFromUrl(pdf).then((f) {
      setState(() {
        urlPDFPath = f.path;
        print(urlPDFPath);
        downloadControl = true;
      });
    });
  }

  Future<String> prepareTestPdf() async {
    final ByteData bytes =
        await DefaultAssetBundle.of(context).load(urlPDFPath);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$urlPDFPath';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdfonline.pdf");

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          "DigiLib",
          style: TextStyle(
              color: Colors.white,
              height: 1,
              fontSize: 27,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => {
                if (downloadControl){
                    prepareTestPdf().then((path) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullPdfViewerScreen(path)),
                      );
                    }),
                    downloadControl = false,
                }
              },
              child: const Text('Abrir PDF'),
            ),
          ],
        ),
      ),
    );
  }
}

class FullPdfViewerScreen extends StatelessWidget {
  final String pdfPath;

  FullPdfViewerScreen(this.pdfPath);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            "DigiLib",
            style: TextStyle(
                color: Colors.white,
                height: 1,
                fontSize: 27,
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onPressed: () {
                downloadControl = false;
                Navigator.pop(context);
              },
            ),
          ],
        ),
        path: pdfPath);
  }
}
