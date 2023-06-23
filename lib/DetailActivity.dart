import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tentrailer/url_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'CategoryDetailResponce.dart';
import 'package:http/http.dart' as http;

import 'MyWidget.dart';
import 'TitleDetailActivity.dart';
import 'YoutubePlayerScreen.dart';



class DetailActivity extends StatefulWidget {
  final String categoryId;
  final String subcategoryId;
  final String header;
  final String subname;

  DetailActivity(
      {required this.categoryId,
        required this.subcategoryId,
        required this.header,
        required this.subname});

  @override
  _DetailActivityState createState() => _DetailActivityState();
}

class _DetailActivityState extends State<DetailActivity> {
  Future<CategoryDetailResponce>? fetchdata;

  List<CategoryDetailData> categoryDetailData = [];


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var newData = await ChatApiService.fetchRouteData(widget.categoryId,widget.subcategoryId);
    CategoryDetailResponce manufacturerListResponse = await Future.value(newData);

    setState(() {
      fetchdata = Future.value(newData);
      categoryDetailData.clear();
      categoryDetailData = manufacturerListResponse.data!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/backgoundmain.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/image/logo.png',
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF6A9756),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Center(
                child:Text(
                  (widget.subname != null && widget.subname.isNotEmpty)
                      ? '${widget.header} / ${widget.subname}'
                      : widget.header,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDAE8BD),
                    fontFamily: 'assets/fonts/poppinssemibold.ttf',
                  ),
                ),


              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  itemCount: categoryDetailData.length,
                  itemBuilder: (context, index) {
                    final data = categoryDetailData[index];
                    if (data.type == 1) {return
                        Container(
                          margin: EdgeInsets.only(top: 0, bottom: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: Container(
                                  color: Color(0xFF6A9756),
                                  child: Center(
                                    child: Text(
                                      data.name!,
                                      style:TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFDAE8BD),
                                        fontFamily: 'assets/fonts/poppinssemibold.ttf',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                          GestureDetector(
                            onTap: () {
                              String name = data.name!;
                              String description = data.description!;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TitleDetailPage(
                                    name: name,
                                    description: description,
                                    header: widget.header!,
                                    subname: widget.subname!,
                                  ),
                                ),
                              );
                            },child:
                          Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFB2C888),
                                ),
                                child:
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    data.description ?? '',
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFF6A9756),
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'assets/fonts/poppinsregular.ttf',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ),

                              Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                color:Color(0xFFB2C888),
                                height: 2,
                              ),
                            ],
                          ),
                        );
                    }
                    else if (data.type == 2) {
                      return
                        Container(

                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: Container(
                                  color: Color(0xFF6A9756),
                                  child: Center(
                                    child:Text(
                                      data.name ?? '',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFDAE8BD),
                                        fontFamily: 'assets/fonts/poppinssemibold.ttf',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,10,10,0),
                                height: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF6A9756),
                                    width: 10,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Stack(
                                  children: [
                                    if (data.videoUrl != null) ...[
                                      Positioned.fill(
                                        child: data.image != null
                                            ? Image.network('${data.image}',fit: BoxFit.fill,)
                                            : SizedBox(),
                                      ),
                                      Positioned.fill(
                                        child: IconButton(
                                          icon: Image.asset(
                                           'assets/image/playbutton.png',
                                              width: 35,
                                              height: 35,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>YoutubePlayerScreen(
                                                  videoUrl: data.videoUrl!,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                    if (data.videoUrl == null) ...[
                                      Positioned.fill(
                                        child: Image.network(data.image ?? ''),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                color: Color(0xFFB2C888),
                                height: 3,
                              ),
                            ],
                          ),
                        );

                    }
                    else if (data.type == 3) {
                      return
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                            SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: Container(
                              color: Color(0xFF6A9756),
                              child: Center(
                                child:Text(
                                    data.name ?? '',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFDAE8BD),
                                    fontFamily: 'assets/fonts/poppinssemibold.ttf',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            ),
                              SizedBox(
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                    String name = data.name!;
                                    String description = data.description!;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TitleDetailPage(
                                          name: name,
                                          description: description,
                                          header: widget.header!,
                                          subname: widget.subname!,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFB2C888),
                                    ),
                                    child: Text(
                                      data.description ?? '',
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xFF6A9756),
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'assets/fonts/poppinsregular.ttf',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                color: Color(0xFFB2C888),
                                height: 3,
                              ),
                            ],
                          ),
                        );
                    }
                    else if (data.type == 4) {
                      return
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: Container(
                                  color: Color(0xFF6A9756),
                                  child: Center(
                                    child:Text(
                                      data.name ?? '',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFDAE8BD),
                                        fontFamily: 'assets/fonts/poppinmedium.ttf',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child:
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFB2C888),
                                  ),
                                  child:
                                  Text(
                                    data.description ?? '',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFF6A9756),
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'assets/fonts/poppinsregular.ttf',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child:
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFB2C888),
                                  ),
                                  child:
                                  GestureDetector(
                                    onTap: () {
                                      String? websiteUrl = data?.websiteUrl;
                                      redirectToWebsite(context, websiteUrl!);
                                    },
                                    child: Text(
                                      data.websiteUrl ?? '',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xFF6A9756),
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'assets/fonts/poppinsregular.ttf',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                color: Color(0xFFB2C888),
                                height: 3,
                              ),
                            ],
                          ),
                        );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyWidget()),
                            (route) => false, // Remove all previous routes
                      );
                    },
                    child: Container(
                      color: Color(0xFFDBEAC1),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6A9756),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'assets/fonts/poppinssemibold.ttf',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 1),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      color:  Color(0xFFDBEAC1),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Terug",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6A9756),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'assets/fonts/poppinssemibold.ttf',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void redirectToWebsite(BuildContext context, String websiteUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Website'),
          content: Text('You are now leaving the app and redirecting to the website!'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                if (await canLaunch(websiteUrl)) {
                  await launch(websiteUrl);
                } else {
                  // Handle error if the URL can't be launched
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: "Could not launch the website");
    }
  }

  void navigateToHome() {
    Navigator.pop(context);
  }

  void onBackPressed() {
    Navigator.pop(context);
  }
}

class ChatApiService {
  static var client = http.Client();

  static Future<CategoryDetailResponce> fetchRouteData(String category_id,String sub_category_id) async {
    var headers = {'Content-Type': 'application/json'};
    var url =
    Uri.parse(AppUrls.baseUrl + AppUrls.getCategoryDetail);
    Map body = {
      'category_id': category_id,
      'sub_category_id': sub_category_id,
    };
    http.Response response =
    await http.post(url, body: jsonEncode(body), headers: headers);
    // print("Route Model Data is :........");
    // print(response.body);
    if (response.statusCode == 200) {
      return routeModelFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

}

class YoutubePlayer extends StatelessWidget {
  final String type;
  final String videoUrl;

  YoutubePlayer({required this.type, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    // Implement the YouTube player widget here
    // Example: YoutubePlayerController(...)
    return Container();
  }
}

