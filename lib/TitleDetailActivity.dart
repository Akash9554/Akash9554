import 'package:flutter/material.dart';

import 'MyWidget.dart';

class TitleDetailPage extends StatefulWidget {
  final String description;
  final String name;
  final String header;
  final String subname;

  TitleDetailPage({
    required this.description,
    required this.name,
    required this.header,
    required this.subname,
  });

  @override
  _TitleDetailPageState createState() => _TitleDetailPageState();
}

class _TitleDetailPageState extends State<TitleDetailPage> {
  @override
  void initState() {
    super.initState();
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
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFF6A9756),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Center(
                child: Text(
                  (widget.subname != null && widget.subname.isNotEmpty)
                      ? '${widget.header} / ${widget.subname} / ${widget.name}'
                      : '${widget.header} / ${widget.name}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDAE8BD),
                    fontFamily: 'poppinssemibold',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: SingleChildScrollView( // Wrap with SingleChildScrollView to handle overflow
                  child: Container(
                    margin: EdgeInsets.only(top: 0, bottom: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFFB2C888),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '${widget.description}',
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
                          color: Color(0xFFB2C888),
                          height: 2,
                        ),
                      ],
                    ),
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
                      color: Color(0xFFDBEAC1),
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
