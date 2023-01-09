import 'package:assignment1/home.dart';
import 'package:assignment1/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  var isLoading = true;
  var newsDataFromAPI;
  NewsQueryModel News = NewsQueryModel();
  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("newsdata", newsDataFromAPI['article']);
  }

  read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    newsDataFromAPI['article'] = prefs.getString("newsdata");
  }

  setupNews() async{
    newsDataFromAPI = await News.getNews();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    read();
    super.initState();
    setupNews();
  }

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
                fontWeight: FontWeight.bold,
                color: HexColor("#ffffff"),
              ),
            )),
      ),
      body: isLoading? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: newsDataFromAPI['articles'].length,
                    itemBuilder: (context, index) {
                      return newsCard(context, newsDataFromAPI["articles"][index]);
                    })),
          ],
        ),
      )
    );
  }
}

Widget newsCard(context, news){
  var news1 = news["source"];
   var now = DateTime.parse(news['publishedAt']);
   var time = DateFormat.yMMMd().format(now);
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage(newsImg: news['urlToImage'], newsHead: news['title'], newsName: news1['name'], newsDes: news['description'], date: time,)) );
    },
    child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 16, vertical: 12),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13)),
          elevation: 1.5,
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network("${news['urlToImage']}")),
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
                          Text("${news['title']}", style: GoogleFonts.robotoSlab(
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
                              Text("${news1['name']}",style: GoogleFonts.robotoSlab(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("#bababa"),
                                ),
                              ),),
                              SizedBox(width: 16,),
                              Text(time,style: GoogleFonts.robotoSlab(
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