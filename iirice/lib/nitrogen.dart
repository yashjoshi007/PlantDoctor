import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'nresult.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
List<DetailN> detailNs = [
  DetailN(picture: Image.asset("assets/nitro1.JPG"),
      topic: 'Deficiency 75%-100%',
      info: 'The leaves turns out completely white. The leaves loses its flexibility completely and crop becomes brittle.',
      solution: 'Inorganic amendments suggest using synthesized N-containing fertilizers to promote crop recovery from nitrogen deficiency, e.g., NPK, nitrolime, ammonium nitrate, urea, etc.',
      links: 'https://youtu.be/ManD4JLW4z4'),
  DetailN(picture: Image.asset("assets/nitro2.jpg"),
      topic: 'Deficiency 50%-75%',
      info: 'The stems or petioles become purple or reddist. Leaves turn yellow.',
      solution: 'using synthesized N-containing fertilizers to promote crop recovery from nitrogen deficiency, e.g., NPK, nitrolime, ammonium nitrate, urea, etc. Even organic meathods may be effective.',
      links: 'https://youtu.be/ManD4JLW4z4'),
  DetailN(picture: Image.asset("assets/nitro3.jpg"),
      topic: 'Deficiency 25%-50%',
      info: 'Excessive deep root penetration with low biomass and density. Leaves turns yellowish.',
      solution: 'Organic matter not only adds vital nutrients for plants but improves soil structure and helps retain soil moisture. Basic sources of N supply are widely used in organic farming.',
      links: 'https://youtu.be/ManD4JLW4z4'),
  DetailN(picture: Image.asset("assets/nitro4.JPG"),
      topic: 'Deficiency 1%-25%',
      info: 'The leaves turns pale-green. The stems gets short and thin.',
      solution: 'Prevention helps to avoid the issue of N starvation. Measures like proper soil drainage, balanced use of fretilisers can cure it easily.',
      links: 'https://youtu.be/ManD4JLW4z4'),
];
class _HomePageState extends State<HomePage1> {
  String x='';
  late int y;
  bool loading = true;
  late File _image;
  late List _output ;
  final imagepicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
    pick_integer().then((value)
    {
      setState(() {

      });
    });
  }

  detectimage(File image) async {
    var prediction = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _output = prediction!;
      loading = false;
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant1.tflite', labels: 'assets/labels1.txt');
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickimage_camera() async {
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image);
  }

  pick_integer() async{
    if(x=='Nitrogen Level : 75-100%')
    {
      y=0;
    }
    else if(x=='Nitrogen Level : 50-75%')
    {
      y=1;
    }
    else if(x=='Nitrogen Level : 25-50%')
    {
      y=2;
    }
    else if(x=='Nitrogen Level : 1-25%')
    {
      y=3;
    }

  }

  pickimage_gallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Container(
              height: 200,
              width: 300,
              padding: EdgeInsets.all(10),
              child: ClipRRect(borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage('assets/h2.jpg'),
                ),
              ),
            ),
            Container(
                child: Text('Check Nitrogen Deficiency',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ))),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Capture',
                            style: GoogleFonts.roboto(fontSize: 18)),
                        onPressed: () {
                          pickimage_camera();
                        }),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Gallery',
                            style: GoogleFonts.roboto(fontSize: 18)),
                        onPressed: () {
                          pickimage_gallery();
                        }),
                  ),
                ],
              ),
            ),
            loading != true
                ? Container(
              child: Column(
                children: [
                  Container(
                    height: 220,
                    // width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Image.file(_image),
                  ),
                  _output != null

                      ? Text(
                      x=(_output[0]['label']).toString().substring(2),


                      style: GoogleFonts.roboto(fontSize: 25))


                      : Text(''),




                  //? Text(
                  // 'Confidence: ' +
                  //  (_output[0]['confidence']).toString(),
                  //style: GoogleFonts.roboto(fontSize: 18))


                  SizedBox(height: 10,),

                  _output != null
                      ?

                  ElevatedButton( onPressed: () { pick_integer();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => nitroMore(detailN: detailNs[y])));
                  }, child: const Text('Know More'),
                    style: ElevatedButton.styleFrom(

                      minimumSize: Size(240,50),
                      textStyle: GoogleFonts.poppins(fontSize: 24,),
                      primary: Colors.brown.shade300,
                      onPrimary: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,



                    ),

                  )
                      :Text(' '),
                ],

              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }
}
class DetailN{
  Image picture; String topic;
  String info;
  String solution;
  String links;

  DetailN({required this.picture, required this.topic, required this.info, required this.solution, required this.links});
}
