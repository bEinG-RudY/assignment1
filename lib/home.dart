import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatelessWidget {

  late String newsHead;
  late String newsName;
  late String newsDes;
  late String newsImg;
  late String date;
  HomePage({ required this.newsImg, required this.newsHead , required this.newsName, required this.newsDes, required this.date });




  @override
  Widget build(BuildContext context) {
    var date;
    return Scaffold(
      body: Container(

          child: Card(
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13)),
            elevation: 1.5,
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.network("${newsImg}")),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(13),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black12
                                      .withOpacity(0),
                                  Colors.black.withOpacity(.7),
                                  Colors.black
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        padding: EdgeInsets.fromLTRB(
                            10, 30, 50, 12),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text("${newsHead}", style: GoogleFonts.robotoSlab(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal
                                ,
                                color: HexColor("#f2f2f2"),
                              ),
                            ),
                            ),
                            SizedBox(height: 24,),
                            Row(
                              children: [
                                Text("${newsName}",style: GoogleFonts.robotoSlab(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor("#bababa"),
                                  ),
                                ),),
                                SizedBox(width: 16,),
                                Text(
                                  "${date}",style: GoogleFonts.robotoSlab(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    color: HexColor("#bababa"),
                                  ),
                                ),),
                              ],
                            )
                          ],
                        )))
              ],
            ),
          )),

    );
  }
}
