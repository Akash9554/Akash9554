import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'MyWidget.dart';

class YoutubePlayerScreen extends StatefulWidget {
  final String videoUrl;

  YoutubePlayerScreen({required this.videoUrl});

  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (MediaQuery
            .of(context)
            .orientation != Orientation.portrait) {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          return false; // Prevents the back navigation
        }
        return true; // Allows the back navigation
      },
      child:
      Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/backgoundmain.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(

            children: [

              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  // Adjust the margin value as needed
                  child: Stack(
                    children: [
                      YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Color(0xFF6A9756),
                        onReady: () {
                          // Perform any additional operations on player ready
                        },
                        onEnded: (data) {
                          // Perform any operations after video ends
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: MediaQuery
                    .of(context)
                    .orientation == Orientation.portrait,
                child: Container(
                  color: Color(0xFFDBEAC1),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyWidget()),
                                  (
                                  route) => false, // Remove all previous routes
                            );
                          },
                          child: Container(
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
                            if (MediaQuery
                                .of(context)
                                .orientation != Orientation.portrait) {
                              SystemChrome.setPreferredOrientations(
                                  [DeviceOrientation.portraitUp]);
                            }
                            Navigator.pop(context);
                          },
                          child: Container(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
