import 'package:carousel_slider/carousel_slider.dart';
import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 25.0,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              viewportFraction: 0.8,
              aspectRatio: 16/9,
              initialPage: 0,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(
                seconds: 3,
              ),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeOut,
            ),
            items: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/l1.jpg'
                        ), fit:BoxFit.cover
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/l2.jpg'
                        ), fit:BoxFit.cover
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/l3.jpg'
                        ), fit:BoxFit.cover
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/l4.JPG'
                        ), fit:BoxFit.cover
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/l5.JPG'
                        ), fit:BoxFit.cover
                    )
                ),
              )
            ],),
          const SizedBox(
            height: 25.0,
          ),
          SizedBox(
              height: 450,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.green,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),

                ),

                child: Column(
                    children:<Widget>[Padding( padding: const EdgeInsets.only(top:10, bottom:10),
                      child: Text('What do we offer our customers ?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          color: Colors.black,
                        ),
                      ),
                    ),

                      Padding(padding: const EdgeInsets.only(left:10, top:10, bottom:10, right: 10),
                          child: Text('Plant is exposed to many attacks from various microorganisms, '
                              'bacterial disease and pests. The symptoms of the attacks are usually '
                              'distinguished through the leaves, stem or fruit inspection. '
                              'We at iRice Doctor provide our customers service in two different ways: '
                              'Check Leaf Disease and Check Nitrogen Deficiency.',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                      )
                    ]),
              )
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.green,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),

                ),

                child: Column(
                    children:<Widget>[Padding( padding: const EdgeInsets.only(top:10, bottom:10),
                      child: Text('Check Leaf Disease',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          color: Colors.black,
                        ),
                      ),
                    ),

                      Padding(padding: const EdgeInsets.only(left:10, top:10, bottom:10, right: 10),
                          child: Text('Rice disease has serious negative effects on crop yield, '
                              'and the correct diagnosis of rice diseases is the key to avoid these effects. '
                              'However, specially for rural areas the existing disease diagnosis methods for rice are neither efficient '
                              'nor economically feasible. Our Mobile Application is the go to thing to meet these requirements.',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                      )
                    ]),
              )
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
              height: 450,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.green,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),

                ),

                child: Column(
                    children:<Widget>[Padding( padding: const EdgeInsets.only(top:10, bottom:10),
                      child: Text('Check Nitrogen Deficiency',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          color: Colors.black,
                        ),
                      ),
                    ),

                      Padding(padding: const EdgeInsets.only(left:10, top:10, bottom:10, right: 10),
                          child: Text('Nitrogen deficiency is the most commonly detected nutrient disorder observed in rice. '
                              'Old leaves and sometimes all leaves become light green and chlorotic at the tip. Nitrogen deficiency '
                              'often occurs at critical growth stages such as tillering and panicle initiation, when the demand for N is large. '
                              'At such a time a easy to use application is a must and that is what we offer our customers.',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                      )
                    ]),
              )
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );


  }
}