import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatelessWidget {
  late String newsHead;
  late String newsName;
  late String newsDes;
  late String newsImg;
  late String date;
  HomePage(
      {required this.newsImg,
      required this.newsHead,
      required this.newsName,
      required this.newsDes,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.network("${newsImg}",fit: BoxFit.cover, height: double.infinity, width: double.infinity, alignment: Alignment.center, ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.black12.withOpacity(0),
                  Colors.black.withOpacity(.7),
                  Colors.black
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                padding: EdgeInsets.symmetric(horizontal: 24,  vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${newsHead}",
                      style: GoogleFonts.robotoSlab(
                        textStyle: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: HexColor("#f2f2f2"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${newsName}",
                          style: GoogleFonts.robotoSlab(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: HexColor("#f2f2f2"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "${date}",
                          style: GoogleFonts.robotoSlab(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: HexColor("#bababa"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "${newsDes}",
                      style: GoogleFonts.robotoSlab(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: HexColor("#bababa"),
                        ),
                      ),
                    ),
                  ],
                )))
      ],
    ));
  }
}
