import 'package:flutter/material.dart';
import 'package:flutter_app/pages/liked_page.dart';
import 'package:flutter_app/pages/my_recipes_page.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[100], Colors.pink[50]],
                begin: FractionalOffset.centerRight,
                end: FractionalOffset.centerLeft,
              )
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 20,
                    right: 0,
                    left: 0,
                    bottom: 10),


                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(width: 35,),
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
                    SizedBox(width: 35,),

                  ],
                ),

              ),

              Container(
                child: Container(
                  width: 410,
                  height: 230,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: Colors.blue[900],
                        width: 2,
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.pink[100],
                          ]
                      )

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10), //10
                        height: 120, //140
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue[900],
                            width: 4,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/user.jpg"),
                          ),
                        ),
                      ),

                      Text("User_cat",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.deepPurple[900],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Cat@gmail.com",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.pink[500],
                        ),
                      ),

                      SizedBox(height: 15),
                    ],
                  ),
                ),

              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LikedPage()));
                },
                child: Container(
                    width: 380,
                    height: 90,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: Colors.blue[900],
                          width: 2,
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.pink[100],
                            ]
                        )

                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 25,),
                          Text(
                            "Liked Recipes",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 30,
                              color: Colors.blue[900],
                            ),
                          ),

                        ]
                    )
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyRecipes()));
                },
                child: Container(
                    width: 380,
                    height: 90,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: Colors.blue[900],
                          width: 2,
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.pink[100],
                            ]
                        )

                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 25,),
                          Text(
                            "My Recipes",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 30,
                              color: Colors.blue[900],
                            ),
                          ),

                        ]
                    )
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  width: 380,
                  height: 90,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.blue[900],
                        width: 2,
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.pink[100],
                          ]
                      )

                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 25,),
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 30,
                            color: Colors.blue[900],
                          ),
                        ),

                      ]
                  )
              ),
            ],
          ),
        )
    );
  }



}
