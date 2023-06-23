import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tentrailer/url_constants.dart';

import 'CategoryListResponce.dart';
import 'package:http/http.dart' as http;

import 'DetailActivity.dart';
import 'SubcategoryScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>{
  Future<CategoryListResponce>? fetchdata;
  List<CategoryListData>? data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var newData = await ChatApiService.fetchRouteData();
    CategoryListResponce? manufacturerListResponse = await Future.value(newData);

    setState(() {
      fetchdata = Future.value(newData);
      data?.clear();
      data = manufacturerListResponse?.data!;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        Padding(
          padding: EdgeInsets.fromLTRB(10,5,10,5),
          child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
          child: GestureDetector(
          onTap: () {
            if (!( data![0].subCategory!.isEmpty)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubcategoryScreen(
                    categoryListData: data?[0].subCategory ?? [],
                    title: "${data?[0].name}",
                    position: 0,
                  ),
                ),
              );
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailActivity(
                    categoryId: "${data?[0].id}",
                    subcategoryId: "",
                    header: "${data?[0].name}",
                    subname: "",
                  ),
                ),
              );



            }
        },
                  child: CardViewWithText(
                      text: "${data?[0].name}"),
          ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (!( data![1].subCategory!.isEmpty)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubcategoryScreen(
                              categoryListData: data?[1].subCategory ?? [],
                              title: "${data?[1].name}",
                              position: 1,
                            ),
                          ),
                        );
                      }else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailActivity(
                              categoryId: "${data?[1].id}",
                              subcategoryId: "",
                              header: "${data?[1].name}",
                              subname: "",
                            ),
                          ),
                        );



                      }
                    },
                  child: CardViewWithText(text: "Instructie \n video's"),
                  ),
                ),
              ],
            ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10,5,10,5),
          child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
          child: GestureDetector(
          onTap: () {
            if (!( data![2].subCategory!.isEmpty)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubcategoryScreen(
                    categoryListData: data?[2].subCategory ?? [],
                    title: "${data?[2].name}",
                    position: 2,
                  ),
                ),
              );
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailActivity(
                    categoryId: "${data?[2].id}",
                    subcategoryId: "",
                    header: "${data?[2].name}",
                    subname: '',
                  ),
                ),
              );
            }
        },
                  child: CardViewWithText(text: "Kampeer \n tips"),
          ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (!( data![3].subCategory!.isEmpty)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubcategoryScreen(
                              categoryListData: data?[3].subCategory ?? [],
                              title: "${data?[3].name}",
                              position: 3,
                            ),
                          ),
                        );
                      }else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailActivity(
                              categoryId: "${data?[3].id}",
                              subcategoryId: "",
                              header: "${data?[3].name}",
                              subname: "",
                            ),
                          ),
                        );
                      }
                    },
                  child: CardViewWithText(text: "${data?[3].name}"),
                  ),
                ),
              ],
            ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10,5,10,5),
          child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
          child: GestureDetector(
          onTap: () {
            if (!( data![4].subCategory!.isEmpty)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubcategoryScreen(
                    categoryListData: data?[4].subCategory ?? [],
                    title: "${data?[4].name}",
                    position: 4,
                  ),
                ),
              );
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailActivity(
                    categoryId: "${data?[4].id}",
                    subcategoryId: "",
                    header: "${data?[4].name}",
                    subname: "",
                  ),
                ),
              );
            }
        },
                  child: CardViewWithText(text: "${data?[4].name}"),

          ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      String? websiteUrl = data?[5].websiteUrl;
                      redirectToWebsite(context, websiteUrl!);

                    },
                  child: CardViewWithText(text: "${data?[5].name}"),
                  ),
                ),
              ],
            ),
        ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
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


class CardViewWithText extends StatelessWidget {
  final String text;

  const CardViewWithText({required this.text});

  @override
  Widget build(BuildContext context) {
    return
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Color(0xFF6A9756),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.35,
          child: Center(
            child:Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFDAE8BD),
                fontWeight: FontWeight.bold,
                fontFamily: 'assets/fonts/poppinssemibold.ttf',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );


  }


}

class ChatApiService {
  static var client = http.Client();

  static Future<CategoryListResponce> fetchRouteData() async {
    var headers = {'Content-Type': 'application/json'};
    var url =
    Uri.parse(AppUrls.baseUrl + AppUrls.getCategory);
    Map body = {
      'user_id': 6,
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


