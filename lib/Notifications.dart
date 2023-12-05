
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(
                        "Reinforcement")
                        .orderBy('time', descending: true)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<DocumentSnapshot> nn = snapshot.data!.docs;
                        return SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                (nn.length == 0)
                                    ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text("No report found"),
                                  ),
                                )
                                    : SizedBox(),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Notifications",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24))),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: nn.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            child: TextButton(
                                              onPressed:  () => showDialog<String>(
                                                context: context,
                                                builder: (BuildContext context) => AlertDialog(
                                                  title: const Text('Your Assumption'),
                                                  content: 
                                                     Container(
                                                       height: 300,
                                                       child: Column(
                                                         children: [
                                                           Align(
                                                            alignment: Alignment.topCenter,
                                                            child: Container(
                                                              height: 110,
                                                              width: 60,
                                                              color: Colors.blue,
                                                            ),
                                                           ),
                                                           Row(
                                                             children: [
                                                               Text("Model Predicted: ",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 18),),
                                                               Text(nn[index]["Disease"],style: GoogleFonts.poppins(fontSize: 18),)
                                                             ],
                                                           ),

                                                         ],
                                                       ),
                                                     ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                                      child: const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(context, 'OK'),
                                                      child: const Text('OK'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        198, 199, 203, 1),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          8.0),
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(1.0),
                                                            child: Container(
                                                                height: 110,
                                                                width: 110,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      10),
                                                                  image:
                                                                  DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image:
                                                                    NetworkImage(
                                                                      nn[index][
                                                                      "imageUrl"],
                                                                      //"https://images.unsplash.com/photo-1566438480900-0609be27a4be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW1hZ2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60"
                                                                    ),
                                                                  ),
                                                                ),
                                                                child:
                                                                SizedBox()),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(left: 0,
                                                          right: 0,top: 0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text("Model Predicted :",style: GoogleFonts.poppins(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                                                          Container(
                                                              width: 180,
                                                              child: Column(

                                                                children: [

                                                                  Text(
                                                                      nn[index]["Disease"],
                                                                      textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                          textStyle:
                                                                          TextStyle(
                                                                            fontSize:
                                                                            16,
                                                                            color: Colors
                                                                                .black,
                                                                          ))),
                                                                ],
                                                              )),
                                                          Text("Doctor predicted :",style: GoogleFonts.poppins(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                                                          Container(
                                                              width: 180,
                                                              child: Text(nn[index]["predictedDisease"],
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                      textStyle: TextStyle(
                                                                        fontSize:
                                                                        18,
                                                                        color: Colors
                                                                            .black,


                                                                      )))),

                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
