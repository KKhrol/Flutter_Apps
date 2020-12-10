import 'dart:async';
import 'dart:io';
import 'package:flutter_app/models/recipe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipePage extends StatefulWidget {
  final String postUrl, postLabel, postImage, postSource;
  RecipePage({this.postUrl, this.postLabel, this.postImage, this.postSource});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  String finalUrl;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  SharedPreferences prefs;

  @override
  void initState(){
    if (widget.postUrl.contains("http://")) {
      finalUrl = widget.postUrl.replaceAll("http://", "https://");
    }
    else {
      finalUrl = widget.postUrl;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[200], Colors.blue[50]],
                    begin: FractionalOffset.centerRight,
                    end: FractionalOffset.centerLeft,
                  )
              ),
              padding: EdgeInsets.only(top: Platform.isIOS? 60 : 30, right: 12, left: 6, bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: kIsWeb ? MainAxisAlignment.start : MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Positioned(
                      top: 6.0,
                      left: 2,
                      child: Container(
                        height: 45.0,
                        width: 55.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.pinkAccent[200],
                                Colors.red[100],
                              ]
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.blue[200],
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_left, size: 45, color: Colors.blue[100],),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 25,),
                  Text("Gourmet", style: TextStyle(
                      fontFamily: "DancingScript",
                      color: Colors.blueAccent[200],
                      fontSize: 50
                    )),
                  Text("Recipes", style: TextStyle(
                      color: Colors.pink[300],
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),),
                  SizedBox(width: 25,),
                  InkWell(

                    onTap: (){
                      //Save_recipe;
                    },
                    child: Positioned(
                      top: 6.0,
                      left: 2,
                      child: Container(
                        height: 45.0,
                        width: 55.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.pinkAccent[200],
                                Colors.pink[100],
                              ]
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.blue[200],
                        ),
                        child: Center(
                          child: Icon(Icons.favorite_outline_rounded,
                            size: 40,
                            color: Colors.blue[200],),
                        ),
                      ),
                    ),
                  ),

                  ],
                ),
              ),
            Container(
              height: MediaQuery.of(context).size.height - 124,
              width: MediaQuery.of(context).size.width,
              child: WebView(
                initialUrl: finalUrl,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  setState(() {
                    _controller.complete(webViewController);
                  });
                }
              ),
            ),
            ],
          ),
        )
    );
  }

}
