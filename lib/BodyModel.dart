import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:novalabs/GoogleSignin.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BodyModel extends StatelessWidget {
  const BodyModel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(37, 92, 186, 0.979),
        appBar: AppBar(
          title: Text('Profile'),
          actions: [
            // Profile Icon
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: GoogleSignin(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 400, // Set a fixed height for the ModelViewer
                child: ModelViewer(
                  backgroundColor: Color.fromRGBO(37, 92, 186, 0.979),
                  src: 'assets/models/human_body.glb',
                  alt: 'A 3D model of Human Body',
                  ar: true,
                  autoRotate: true,
                  disableZoom: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 18),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    crossAxisSpacing: 14.0, // Spacing between columns
                    mainAxisSpacing: 14.0, // Spacing between rows
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    List<String> cardNames = [
                      'Head',
                      'Body',
                      'Left Hand',
                      'Right Hand',
                      'Left Leg',
                      'Right Leg',
                    ];

                    return Card(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                cardNames[index],
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Your Skin Type",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        15.0), // Adjust the radius as needed
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              // Wrap the Text widget with Flexible
                              child: Text(
                                "Based on your answers, we have determined your skin type:",
                                softWrap: true,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  "The Fitzpatrick skin type (or phototype) depends on the amount of melanin pigment in the skin. This is determined by constitutional colour (white, brown, or black skin) and the effect of exposure to ultraviolet radiation (tanning). Pale or white skin burns easily and tans slowly and poorly",
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 14,
                                      wordSpacing: 1,
                                      color: Colors.black87),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              // Icon and Text at the start
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.timelapse_rounded,
                                      color: Colors.blueAccent,
                                    ), // Replace with your desired icon
                                    SizedBox(
                                        width: 8), // Adjust spacing as needed
                                    Text(
                                      "Type II",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              // Another Icon at the end
                              Icon(
                                Icons.info_outline_rounded,
                                color: Colors.blueAccent,
                              ), // Replace with your desired icon
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            children: [
                              // ... Other widgets ...

                              OutlinedButton(
                                onPressed: () {
                                  // Handle the button press event here
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Adjust the radius as needed
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 90, vertical: 12),
                                  child: Text(
                                    "Try Again",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
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
