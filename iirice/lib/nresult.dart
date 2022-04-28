import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'nitrogen.dart';

class nitroMore extends StatefulWidget {
  final DetailN detailN;
  const nitroMore({required this.detailN, Key? key}) : super(key : key);


  @override
  _nitroMoreState createState() => _nitroMoreState(detailN: detailN);
}

class _nitroMoreState extends State<nitroMore> {
  late YoutubePlayerController _controller;
  late DetailN detailN;
  _nitroMoreState({required this.detailN});

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId : YoutubePlayer.convertUrlToId(detailN.links) !,
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
            title: Text(detailN.topic),
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
                      child: detailN.picture,
                    ),

                    const SizedBox(height: 15.0,),

                    SizedBox(height: 150, width: 350,
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
                              child: Text(detailN.info,
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

                    SizedBox(height: 200, width: 350,
                      child: Card(elevation: 0.0,
                        child: Column(
                          children: [

                            ListTile(
                              title: Text(
                                'Solution:',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),

                            Padding(padding: const EdgeInsets.fromLTRB(
                                10.0, 0.0, 10.0, 10.0),
                              child: Text(detailN.solution,
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