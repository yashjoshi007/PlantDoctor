import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iirice/result.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
List<Detail> details = [
  Detail(photo: Image.asset("assets/disease1.jpg"),
    title: 'Bacterial Leaf Blight',
    intro: 'Bacterial blight is caused by Xanthomonas oryzae pv. oryzae. It causes '
        'wilting of seedlings and yellowing and drying of leaves. The disease is most likely to '
        'develop in areas that have weeds and stubbles of infected plants. It can occur in both '
        'tropical and temperate environments, particularly in irrigated and rainfed lowland areas. '
        'In general, the disease favors temperatures at 25−34°C, with relative humidity above 70%.',
    tips: 'Using balanced amounts of plant nutrients, especially nitrogen, '
        'Ensuring good drainage of fields and nurseries, Keeping fields clean and Removing weed hosts and '
        'plow under rice stubble, straw, rice ratoons and volunteer seedlings, which can serve as hosts of bacteria and '
        'allowing fallow fields to dry in order to suppress disease agents in the soil and plant residues are some '
        'methods to prevent this type of disease.',
    link: 'https://youtu.be/q7b5E1ETVGo',

  ),
  Detail(photo: Image.asset("assets/disease2.jpg"),
    title: 'Blast',
    intro: 'Blast is caused by the fungus Magnaporthe oryzae. It can affect all above ground parts of a rice plant. It occurs in areas with low soil moisture, '
        'frequent and prolonged periods of rain shower, and cool temperature in the daytime. In upland rice, large day-night '
        'temperature differences that cause dew formation on leaves and overall cooler temperatures favor the development of the disease.',
    tips: 'Silicon fertilizers (e.g., calcium silicate) can be applied to soils that are silicon deficient to reduce blast. However, because '
        'of its high cost, silicon should be applied efficiently. Cheap sources of silicon'
        ', can be an alternative. Care should be taken to ensure that the straw is free from blast as the fungus can survive on rice straw and '
        'the use of infected straw as a silicon source can spread the disease further.',
    link: 'https://youtu.be/qOAqvwXgig0',

  ),
  Detail(photo: Image.asset("assets/disease3.jpg"),
    title: 'Brownspot',
    intro: 'Brown spot is a fungal disease that infects the coleoptile, leaves, leaf sheath, panicle '
        'branches, glumes, and spikelets. Its most observable damage is the numerous big spots on the '
        'leaves which can kill the whole leaf. When infection occurs in the seed, unfilled grains or '
        'discolored seeds are formed.The disease can develop in areas with high relative humidity and '
        'temperature between 16 and 36°C.',
    tips: 'Use resistant varieties. Contact your local agriculture office for up-to-date lists of varieties available. '
        'Use fungicides (e.g., iprodione, propiconazole, azoxystrobin, trifloxystrobin, and carbendazim) as seed treatments. Treat seeds '
        'with hot water (53−54°C) for 10−12 minutes before planting, to control primary infection at the seedling stage. '
        'You can also apply required fertilizers for soils that are low in silicon.',
    link: 'https://youtu.be/PR_eMPrDZ_k',

  ),
  Detail(photo: Image.asset("assets/disease4.jpg"),
    title: 'Tungro',
    intro: 'Rice tungro disease is caused by the combination of two viruses, which are transmitted by leafhoppers. It causes leaf discoloration, stunted growth, '
        'reduced tiller numbers and sterile or partly filled grains. Tungro disease viruses are transmitted from one plant to another by leafhoppers that feed on tungro-infected plants. '
        'Leafhoppers can acquire the viruses from any part of the infected plant by feeding on it, even for a short time.',
    tips: 'Grow tungro or leafhopper resistant varieties. This is the most economical means of managing the disease. There are tungro-resistant varieties available '
        'for the Philippines, Malaysia, Indonesia, India, and Bangladesh. Practice synchronous planting with surrounding farms. Adjust planting times '
        'to when green leafhopper are not in season or abundant. Plow infected stubbles immediately after harvest to reduce inoculum sources.',
    link: 'https://youtu.be/dsNhCeVbJxM',

  ),
  Detail(photo: Image.asset("assets/healthy.jpg"),
    title: 'Healthy',
    intro: 'Congratulations ! Your plant is completely healthy. It will grow strongly. The leaves will be firm and root systems will also be well formed.'
        'There are no signs of pests and diseases. This will help plant a vigorous growth, uniform color, a open rather than curled growth and a nice upright appearance. We recommend you, '
        'follow some basic tips that will maintain the health of your plant. For your help, we have list down some basic tips here.',
    tips: 'Procure certified seed of High Yielding Varieties/Hybrids recommended for the area, '
        'Treat the seed with recommended fungicides for minimizing the disease incidence. Sow the pre-germinated seed of paddy '
        'in nursery bed. Use recommended doses of farm yard manure, '
        'macro and micro nutrients at the time of sowing.Nursery raising for planting systems should be according to scientific recommendation.',
    link: 'https://youtu.be/FW_bw9jdrlQ',

  )
];

class _HomePageState extends State<HomePage> {
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
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
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
    if(x=='Bacterial Leaf Blight')
    {
      y=0;
    }
    else if(x=='Blast')
    {
      y=1;
    }
    else if(x=='BrownSpot')
    {
      y=2;
    }
    else if(x=='Tungro')
    {
      y=3;
    }
    else if(x=='Healthy')
    {
      y=4;
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
                  image: AssetImage('assets/h1.jpg'),
                ),
              ),
            ),
            Container(
                child: Text('Check Leaf Disease',
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
                      MaterialPageRoute(builder: (context) => knowMore(detail: details[y])));
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
class Detail{
  Image photo;
  String title;
  String intro;
  String tips;
  String link;


  Detail({required this.photo, required this.title, required this.intro, required this.tips, required this.link});
}