import 'package:flutter/material.dart';
import 'package:newspaper/views/detail.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ShowSources extends StatefulWidget {
  String? url;
  String? pageurl;
  ShowSources({required this.url,required this.pageurl});

  @override
  State<ShowSources> createState() => _ShowSourcesState();
}

class _ShowSourcesState extends State<ShowSources> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.url.toString()+"mmmmmm");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("News Sources",style: TextStyle(color: Colors.black ),),
        leading: InkWell(
          onTap: () {
          

          },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,),  
        ),
      ),
body: WebView(
  initialUrl:widget.pageurl.toString() ,
)

    );
  }
}