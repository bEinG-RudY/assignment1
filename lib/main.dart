import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#464646"),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor("#000000"),
        title: Text("HEADLINES",
            style: GoogleFonts.robotoSlab(
              textStyle: TextStyle(
                fontSize: 29,
                color: HexColor("#ffffff"),
              ),
            )),
      ),
      body:
      Column(
        children: [
          Container(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index){
                  return Container(
                    child:Text("This is news")
                  );
                })
          ),
        ],
      ),
    );
  }
}
