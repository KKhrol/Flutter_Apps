import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/recipe_model.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LikedPage extends StatefulWidget {
  @override
  _LikedPageState createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {

  List <RecipeModel> recipes = new List<RecipeModel>();

  SharedPreferences prefs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.pink[50],
                              Colors.blue[50],
                            ]
                        )
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ]
            ),
          ),


          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue[200],
                      Colors.blue[100],
                    ]
                )
            ),

            padding: EdgeInsets.only(
                top: 20,
                right: 54,
                left: 0,
                bottom: 10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(width: 40,),
                Text("Gourmet", style: TextStyle(
                    fontFamily: "DancingScript",
                    color: Colors.blue[900],
                    fontSize: 50
                )),
                Text("Recipes", style: TextStyle(
                    color: Colors.pink[300],
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                ),)
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 24 , horizontal: 10),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Positioned(
                            top: 7.0,
                            left: 0,
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
                              child: Icon(Icons.arrow_left, size: 45, color: Colors.blue[100],),
                            ),
                          ),
                        ),
                        SizedBox(width: 40,),
                        Center(
                          child: Text("Liked Recipes", style: TextStyle(
                              fontSize: 40,
                              fontFamily: "Karla",
                              color: Colors.blue[800]
                          ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 410,
                      height: 505,
                    ),

                  ],
                )
            ),
          ),

        ],
      )
    );
  }
}
