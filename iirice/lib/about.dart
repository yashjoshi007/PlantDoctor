import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:drop_cap_text/drop_cap_text.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Padding(padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              shadowColor: Colors.black,
              child: Padding(padding: const EdgeInsets.all(10.0),
                child: DropCapText('iRice Doctor is a mobile application made by students at SRM Institute of Science '
                    'And Technology (SRMIST) under the guidance and mentorship of **Dr. B Baranidharan**, Associate Professor at SRMIST. ',
                  parseInlineMarkdown: true,
                  dropCapPadding: EdgeInsets.only(right: 12.0),
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.brown.shade300
                  ),
                  dropCap: DropCap(
                    width: 100,
                    height: 100,
                    child: ClipRRect(borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage('assets/sb.jpeg'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          Padding(

            padding: EdgeInsets.only(
                top: 20.0, left: 35.0, right: 45.0,bottom: 20),
            child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/yash.png'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(onPressed: ()
                  async {
                    final url = 'https://www.linkedin.com/in/yash-joshi-b4351918b/';
                    if (await canLaunch(url)){
                      await launch(
                        url,
                        forceWebView: true,

                        enableJavaScript: true,

                      );
                    }
                  },


                    child: const Text('YASH J.'),
                    style: ElevatedButton.styleFrom(

                      minimumSize: Size(220, 50),
                      textStyle: GoogleFonts.poppins(fontSize: 24,),
                      primary: Colors.brown.shade300,
                      onPrimary: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,


                    ),
                  ),
                ]),),
          SizedBox(
            height: 10.0,
          ),

          Padding(

            padding: EdgeInsets.only(
                top: 20.0, left: 35.0, right: 45.0,bottom: 20),
            child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/nj.jpeg'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(onPressed: ()
                  async {
                    final url = 'https://www.linkedin.com/in/namannj15/';
                    if (await canLaunch(url)){
                      await launch(
                        url,
                        forceWebView: true,

                        enableJavaScript: true,

                      );
                    }
                  },


                    child: const Text('NAMAN J.'),
                    style: ElevatedButton.styleFrom(

                      minimumSize: Size(220, 50),
                      textStyle: GoogleFonts.poppins(fontSize: 24,),
                      primary: Colors.brown.shade300,
                      onPrimary: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,


                    ),
                  ),
                ]),),
          SizedBox(
            height: 10.0,
          ),

          Padding(

            padding: EdgeInsets.only(
                top: 20.0, left: 35.0, right: 45.0,bottom: 20),
            child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/ad.jpg'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(onPressed: ()
                  async {
                    final url = 'https://www.linkedin.com/in/prakashaaditya18/';
                    if (await canLaunch(url)){
                      await launch(
                        url,
                        forceWebView: true,

                        enableJavaScript: true,

                      );
                    }
                  },


                    child: const Text('ADITYA P.'),
                    style: ElevatedButton.styleFrom(

                      minimumSize: Size(220, 50),
                      textStyle: GoogleFonts.poppins(fontSize: 24,),
                      primary: Colors.brown.shade300,
                      onPrimary: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,


                    ),
                  ),
                ]),),
          SizedBox(
            height: 10.0,
          ),

          Padding(

            padding: EdgeInsets.only(
                top: 20.0, left: 35.0, right: 45.0,bottom: 20),
            child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/ar.jpg'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(onPressed: ()
                  async {
                    final url = 'https://www.linkedin.com/in/aryan-singh-76375118b/';
                    if (await canLaunch(url)){
                      await launch(
                        url,
                        forceWebView: true,

                        enableJavaScript: true,

                      );
                    }
                  },


                    child: const Text('ARYAN S.'),
                    style: ElevatedButton.styleFrom(

                      minimumSize: Size(220, 50),
                      textStyle: GoogleFonts.poppins(fontSize: 24,),
                      primary: Colors.brown.shade300,
                      onPrimary: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,


                    ),
                  ),
                ]),),
          SizedBox(
            height: 10.0,
          ),

          Padding(

            padding: EdgeInsets.only(
                top: 20.0, left: 35.0, right: 45.0,bottom: 20),
            child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/d.jpeg'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(onPressed: ()
                  async {
                    final url = 'https://www.linkedin.com/in/deepak-kumar-b23832206/';
                    if (await canLaunch(url)){
                      await launch(
                        url,
                        forceWebView: true,

                        enableJavaScript: true,

                      );
                    }
                  },


                    child: const Text('DEEPAK K.'),
                    style: ElevatedButton.styleFrom(

                      minimumSize: Size(220, 50),
                      textStyle: GoogleFonts.poppins(fontSize: 24,),
                      primary: Colors.brown.shade300,
                      onPrimary: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,


                    ),
                  ),
                ]),),
          SizedBox(
            height: 10.0,
          ),

          Padding(

            padding: EdgeInsets.only(
                top: 20.0, left: 35.0, right: 45.0,bottom: 20),
            child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/s.jpeg'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(onPressed: ()
                  async {
                    final url = 'https://www.linkedin.com/in/sparshsrivastavaofficial/';
                    if (await canLaunch(url)){
                      await launch(
                        url,
                        forceWebView: true,

                        enableJavaScript: true,

                      );
                    }
                  },


                    child: const Text('SPARSH S.'),
                    style: ElevatedButton.styleFrom(

                      minimumSize: Size(220, 50),
                      textStyle: GoogleFonts.poppins(fontSize: 24,),
                      primary: Colors.brown.shade300,
                      onPrimary: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,


                    ),
                  ),
                ]),),
          SizedBox(
            height: 10.0,
          ),

          Padding(

            padding: EdgeInsets.only(
                top: 20.0, left: 35.0, right: 45.0,bottom: 20),
            child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/rk.jpeg'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(onPressed: ()
                  async {
                    final url = 'https://www.linkedin.com/in/raghav-khatoria-b3053018b/';
                    if (await canLaunch(url)){
                      await launch(
                        url,
                        forceWebView: true,

                        enableJavaScript: true,

                      );
                    }
                  },


                    child: const Text('RAGHAV K.'),
                    style: ElevatedButton.styleFrom(

                      minimumSize: Size(220, 50),
                      textStyle: GoogleFonts.poppins(fontSize: 24,),
                      primary: Colors.brown.shade300,
                      onPrimary: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,


                    ),
                  ),
                ]),),
          Padding(

            padding: EdgeInsets.only(
                top: 20.0, left: 45.0, right: 45.0,bottom: 20),
            child: ElevatedButton(onPressed: ()
            {


            },


              child: const Text('Documentation'),
              style: ElevatedButton.styleFrom(

                minimumSize: Size(240, 50),
                textStyle: GoogleFonts.poppins(fontSize: 24,),
                primary: Colors.deepOrange.shade400,
                onPrimary: Colors.white,
                elevation: 10,
                shadowColor: Colors.black,


              ),
            ),
          ),],
      ),
    );


  }
}