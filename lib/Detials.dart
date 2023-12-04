import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:novalabs/Maps.dart';

class Details extends StatelessWidget {
  final String imagePath;
  int post = 0;
  final Map<String, dynamic>? result;
  Details({super.key, required this.imagePath, required this.result});

  final List<String> sliderItems = [
    "list.png",
    "report.png",
    "3dmap.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Text(
                        "Report ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 1100,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(229, 235, 255, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 300.0,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            enableInfiniteScroll: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            viewportFraction: 0.8,
                          ),
                          items: sliderItems.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(imagePath),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        (result!['result'].length > 1)
                            ? Padding(
                                padding: const EdgeInsets.all(1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Result*:  ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            (double.parse(result!["result"][0]
                                                            [1]) *
                                                        100)
                                                    .round()
                                                    .toString() +
                                                "% Pathology Found",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SizedBox(
                                        height:
                                            300, // Adjust the height of the bar chart as needed
                                        child: BarChart(
                                          BarChartData(
                                            alignment:
                                                BarChartAlignment.spaceAround,
                                            maxY:
                                                100, // Set the maximum value (100%)
                                            barGroups: [
                                              BarChartGroupData(
                                                x: 0,
                                                barRods: [
                                                  BarChartRodData(
                                                      y: double.parse(
                                                              result!["result"]
                                                                  [0][1]) *
                                                          100,
                                                      colors: [Colors.blue]),
                                                ],
                                              ),
                                              BarChartGroupData(
                                                x: 1,
                                                barRods: [
                                                  BarChartRodData(
                                                      y: double.parse(
                                                              result!["result"]
                                                                  [1][1]) *
                                                          100,
                                                      colors: [Colors.green]),
                                                ],
                                              ),
                                              BarChartGroupData(
                                                x: 2,
                                                barRods: [
                                                  BarChartRodData(
                                                      y: double.parse(
                                                              result!["result"]
                                                                  [2][1]) *
                                                          100,
                                                      colors: [Colors.orange]),
                                                ],
                                              ),
                                            ],
                                            titlesData: FlTitlesData(
                                              leftTitles:
                                                  SideTitles(showTitles: true),
                                              bottomTitles:
                                                  SideTitles(showTitles: true),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Diagnosis:  ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Container(
                                            width: 230,
                                            child: Text(
                                              result!["result"][0][0],
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Advice:  ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Container(
                                            width: 250,
                                            child: Text(
                                              "Take visit to dermatologist",
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 60),
                                      child: Column(
                                        children: [
                                          OutlinedButton.icon(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Myapps(),
                                                ),
                                              );
                                            },
                                            icon: Icon(Icons.location_city),
                                            label: Text(
                                              "Find Dermatologist",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 140,
                                      child: Center(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            if (post == 0) {
                                              post = 1;
                                              try {
                                                final c = DateTime.timestamp();

                                                final refe = FirebaseStorage
                                                    .instance
                                                    .ref()
                                                    .child(FirebaseAuth.instance
                                                        .currentUser!.uid)
                                                    .child(c.toString())
                                                    .child("tum");

                                                await refe.putFile(
                                                    File(imagePath),
                                                    SettableMetadata(
                                                        contentType:
                                                            "image/png"));

                                                final downloadUrl1 =
                                                    await FirebaseStorage
                                                        .instance
                                                        .ref()
                                                        .child(FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)
                                                        .child(c.toString())
                                                        .child("tum")
                                                        .getDownloadURL();
                                                final String url1 =
                                                    downloadUrl1.toString();

                                                await FirebaseFirestore.instance
                                                    .collection(FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .email
                                                        .toString())
                                                    .doc("posts")
                                                    .collection("posts")
                                                    .add({
                                                  "time": DateTime.timestamp(),
                                                  "uid": FirebaseAuth.instance
                                                      .currentUser!.uid,
                                                  "title": result!["result"][0]
                                                      [0],
                                                  "title2": result!["result"][1]
                                                      [0],
                                                  "title3": result!["result"][2]
                                                      [0],
                                                  "picture_url": url1,
                                                  "accuracy1": result!["result"]
                                                      [0][1],
                                                  "accuracy2": result!["result"]
                                                      [1][1],
                                                  "accuracy3": result!["result"]
                                                      [2][1],
                                                  "diseases": true
                                                });
                                                post = 2;
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    backgroundColor:
                                                        Colors.greenAccent,
                                                    content: Text('Saved!'),
                                                  ),
                                                );

                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              } catch (error) {
                                                post = 0;
                                                print(post);
                                                print(error);
                                              }
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.location_city),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Save",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 500,
                                        child: Text(
                                          "* This scan result is not a diagnosis. Please consult your doctor for an accurate diagnosis and treatment",
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize:
                                                  16), // Enable text wrapping
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Result*:  ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "No Pathology Found",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(10),
                                    //   child: SizedBox(
                                    //     height:
                                    //     300, // Adjust the height of the bar chart as needed
                                    //     child: BarChart(
                                    //       BarChartData(
                                    //         alignment: BarChartAlignment.spaceAround,
                                    //         maxY: 100, // Set the maximum value (100%)
                                    //         barGroups: [
                                    //           BarChartGroupData(
                                    //             x: 0,
                                    //             barRods: [
                                    //               BarChartRodData(
                                    //
                                    //                   y: result!["result"][0][1].toInt(), colors: [Colors.blue]),
                                    //             ],
                                    //           ),
                                    //           BarChartGroupData(
                                    //             x: 1,
                                    //             barRods: [
                                    //               BarChartRodData(
                                    //                   y: result!["result"][1][1].toInt(), colors: [Colors.green]),
                                    //             ],
                                    //           ),
                                    //           BarChartGroupData(
                                    //             x: 2,
                                    //             barRods: [
                                    //               BarChartRodData(
                                    //                   y: result!["result"][2][1].toInt(), colors: [Colors.orange]),
                                    //             ],
                                    //           ),
                                    //         ],
                                    //         titlesData: FlTitlesData(
                                    //           leftTitles:
                                    //           SideTitles(showTitles: true),
                                    //           bottomTitles:
                                    //           SideTitles(showTitles: true),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Diagnosis:  ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "No Disease Found",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Advice:  ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Container(
                                            width: 250,
                                            child: Text(
                                              "No risk! Advisable to visit Doctor",
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 60),
                                      child: Row(
                                        children: [
                                          OutlinedButton.icon(
                                            onPressed: () {
                                              // Navigator.of(context).push(
                                              //   MaterialPageRoute(
                                              //     builder: (context) => Myapps(),
                                              //   ),
                                              // );
                                            },
                                            icon: Icon(Icons.location_city),
                                            label: Text(
                                              "Find Dermatologist",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 0),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 140,
                                            child: Center(
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  if (post == 0) {
                                                    post = 1;
                                                    try {
                                                      final c =
                                                          DateTime.timestamp();

                                                      final refe =
                                                          FirebaseStorage
                                                              .instance
                                                              .ref()
                                                              .child(FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid)
                                                              .child(
                                                                  c.toString())
                                                              .child("tum");

                                                      await refe.putFile(
                                                          File(imagePath),
                                                          SettableMetadata(
                                                              contentType:
                                                                  "image/png"));

                                                      final downloadUrl1 =
                                                          await FirebaseStorage
                                                              .instance
                                                              .ref()
                                                              .child(FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid)
                                                              .child(
                                                                  c.toString())
                                                              .child("tum")
                                                              .getDownloadURL();
                                                      final String url1 =
                                                          downloadUrl1
                                                              .toString();

                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .email
                                                                  .toString())
                                                          .doc("posts")
                                                          .collection("posts")
                                                          .add({
                                                        "time": DateTime
                                                            .timestamp(),
                                                        "uid": FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid,
                                                        "diseases": false,
                                                        "picture_url": url1
                                                      });
                                                      post = 2;
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          backgroundColor:
                                                              Colors
                                                                  .greenAccent,
                                                          content:
                                                              Text('Saved!'),
                                                        ),
                                                      );

                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    } catch (error) {
                                                      post = 0;
                                                      print(post);
                                                      print(error);
                                                    }
                                                  }
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.location_city),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Save",
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 500,
                                              child: Text(
                                                "* This scan result is not a diagnosis. Please consult your doctor for an accurate diagnosis and treatment",
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontSize:
                                                        16), // Enable text wrapping
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
