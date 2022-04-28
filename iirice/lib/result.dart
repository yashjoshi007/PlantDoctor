import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'disease.dart';
import 'main.dart';


class knowMore extends StatefulWidget {

  final Detail detail;
  const knowMore({required this.detail, Key? key}) : super(key : key);

  @override
  _knowMoreState createState() => _knowMoreState(detail: detail);
}

class _knowMoreState extends State<knowMore> {
  late YoutubePlayerController _controller;
  late Detail detail;
  _knowMoreState({required this.detail});
  // var videoId;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(detail.link) !,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          isLive: false,
          enableCaption: false,
        )
    );
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(

      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {


        return Scaffold(

          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,),
              onPressed: () => Navigator.of(context).pop(),
            ),

            title: Text(detail.title),
            centerTitle: true,
            backgroundColor: Colors.green,
            elevation: 0.0,
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 2.0),
              child: Padding(padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      width: 330,
                      child: detail.photo,
                    ),

                    const SizedBox(height: 15.0,),

                    SizedBox(height: 330, width: 350,
                      child: Card(elevation: 0.0,
                        child: Column(
                          children: [

                            ListTile(
                              title: Text(
                                'About:',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),

                            Padding(padding: const EdgeInsets.fromLTRB(
                                10.0, 0.0, 10.0, 10.0),
                              child: Text(detail.intro,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15.0,),

                    SizedBox(height: 330, width: 350,
                      child: Card(elevation: 0.0,
                        child: Column(
                          children: [

                            ListTile(
                              title: Text(
                                'Tips:',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),

                            Padding(padding: const EdgeInsets.fromLTRB(
                                10.0, 0.0, 10.0, 10.0),
                              child: Text(detail.tips,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15.0,),

                    player,

                    const SizedBox(height: 15.0,),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}