import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/recipe_model.dart';
import 'package:flutter_app/pages/profile_page.dart';
import 'package:flutter_app/pages/recipe_page.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <RecipeModel> recipes = new List<RecipeModel>();

  TextEditingController textEditingController = new TextEditingController();

  String applicationId = "5343c99a";
  String applicationKey = "a749c531cce9a0bf8164cac611476f35";

  getRecipes(String query) async{
    String url = "https://api.edamam.com/search?q=$query&app_id=$applicationId&app_key=$applicationKey";
    var response = await http.get(url);

    Map<String,dynamic> jsonData = jsonDecode(response.body);

    jsonData["hits"].forEach((element){
      print(element.toString());

      RecipeModel recipeModel = new RecipeModel();
      recipeModel = RecipeModel.fromMap(element["recipe"]);
      recipes.add(recipeModel);
    });

    setState(() {

    });
    print("${recipes.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.pink[50],
                  Colors.blue[100],
                ]
              )
            ),
          ),

          SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 24 , horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Gourmet", style: TextStyle(
                          fontFamily: "DancingScript",
                          color: Colors.blueAccent[200],
                          fontSize: 70
                        )),
                        Text("Recipes", style: TextStyle(
                          color: Colors.pink[300],
                            fontWeight: FontWeight.w500,
                          fontSize: 30
                        ),),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                          },
                          child: Positioned(
                            top: 4.0,
                            right: 2.0,
                            child: Container(
                              height: 55.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.blue[200],
                                        Colors.pink[100],
                                      ]
                                  ),
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.blue[200],
                              ),
                              child: Center(
                                child: Icon(Icons.account_box_outlined, size: 50, color: Colors.deepPurple[900],),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60
                    ),
                    Text("What will you cook today?", style: TextStyle(
                      fontSize: 27,
                      color: Colors.black
                    ),),
                    SizedBox(
                        height: 10
                    ),
                    Text("Just Enter the Ingredients you have and we will show the best recipes for you",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black
                    ),),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              decoration: InputDecoration(
                                hintText: "Enter Ingredients...",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.deepPurple[900]
                                  )
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurple[900]
                                    )
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.pink[200].withOpacity(0.5)
                                )
                              ),
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.deepPurple[900]
                              ),
                            ),
                          ),
                          SizedBox(width: 16,),
                          InkWell(
                            onTap: (){
                              if(textEditingController.text.isNotEmpty) {
                                getRecipes(textEditingController.text);
                              }
                              else {
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.pink[100],
                                    Colors.purple[100]
                                  ]
                                )
                              ),
                              child: Icon(Icons.search,
                                color: Colors.deepPurple[900],
                                size: 35,)
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: GridView(

                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,

                          physics: ClampingScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 10.0,
                          ),
                          children: List.generate(recipes.length, (index)  {
                            return GridTile(
                                child: RecipeTitle(
                              title: recipes[index].label,
                            desc: recipes[index].source,
                            imgUrl: recipes[index].image,
                            url: recipes[index].url,

                          ));
                          }),
                      ),
                    ),
                  ],
                )
            ),
          )
        ],
      )
    );
  }
}
class RecipeTitle extends StatefulWidget {
  final String title, desc, imgUrl, url;
  RecipeTitle({this.title, this.desc, this.imgUrl, this.url});
  @override
  _RecipeTitleState createState() => _RecipeTitleState();
}

class _RecipeTitleState extends State<RecipeTitle> {
  _launchURL(String url) async {
    print(url);

    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw("Could not launch $url");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (kIsWeb) {
              _launchURL(widget.url);
            }
            else {
              print(widget.url + "this is what we are going to see");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipePage(
                      postUrl: widget.url,
                      postLabel: widget.title,
                      postImage: widget.imgUrl,
                      postSource: widget.desc,
                    )));
            }
          },
          child: Container(

            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                Image.network(
                  widget.imgUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 200,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white30, Colors.white],
                      begin: FractionalOffset.centerRight,
                      end: FractionalOffset.centerLeft,
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "Karla"
                          ),
                        ),

                        Text(
                          widget.desc,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: "Karla"
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

}


