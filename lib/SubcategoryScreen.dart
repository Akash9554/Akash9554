import 'package:flutter/material.dart';

import 'CategoryListResponce.dart';
import 'DetailActivity.dart';
import 'MyWidget.dart';

class SubcategoryScreen extends StatefulWidget {
  final List<SubCategory> categoryListData; // Assuming you have the category list data
  final String title;
  final int position;

  SubcategoryScreen({
    required this.categoryListData,
    required this.title,
    required this.position,
  });

  @override
  _SubcategoryScreenState createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 40,0,10),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/image/logo.png',
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20,0,10),
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF6A9756),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFDAE8BD),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'assets/fonts/poppinssemibold.ttf',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                 child: Container(
                  height: MediaQuery.of(context).size.height * 0.6, // Adjust the height as needed
                  child: GridView.builder(
                    shrinkWrap: false,
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Set the number of items in a row
                      mainAxisSpacing: 10, // Set spacing between rows vertically
                      crossAxisSpacing: 10,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height * 0.6 / 1.7),// Set spacing between items horizontally
                    ),
                    itemCount: widget.categoryListData.length ?? 0, // Replace with your item count
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailActivity(
                                categoryId: "${widget.categoryListData[index].catId}",
                                subcategoryId: "${widget.categoryListData[index].id}",
                                header: "${widget.title}",
                                subname: "${widget.categoryListData[index].name}",
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(0xFF6A9756),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0), // Adjust the padding values as per your requirement
                                child: Text(
                                    widget.categoryListData[index]?.name ?? '',
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
                          ),
                        ),
                      );
                    },
                  ),
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
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFDAE8BD),
                fontWeight: FontWeight.bold,
                fontFamily: "PoppinsSemibold",
              ),
            ),
          ),
        ),
      );


  }


}
