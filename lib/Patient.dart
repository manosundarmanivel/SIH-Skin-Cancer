import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novalabs/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
List<String> list1 = <String>['Light blue,gray,green','Blue, gray or green','Blue','Dark Brown','Brownish Black'];
List<String> list2 = <String>['Sandy red','Blonde','Chestnut/Dark Blonde','Medium Brown','Dark brown','Black'];
List<String> list3 = <String>['Reddish','Very Pale','Pale with a beinge tint','Light brown','Dark brown'];
List<String> list4 = <String>['Many','Several','Few','Incidental','None'];
List<String> list5 = <String>['Always burns','Usually burns','Burns sometimes followed by peeling','Rare burns','Never had burns'];
List<String> list6 = <String>['Hardly or not at all','Sometimes tans','Tans mostly uniformly','Tans more than average','Always tans'];
List<String> list7 = <String>['Never','Seldom','Sometimes','Often','Always'];
List<String> list8 = <String>['Very sensistive','Sensitive','Normal','Very resistant','Never had a problem'];
List<String> list9 = <String>['More than 3 months ago','2-3 months ago','12 months ago','Less than a month ago','Less than 2 weeks ago'];
List<String> list10 = <String>['Never','Hardly ever','Sometimes','Often','Always'];

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  String dropdown1 = list1.first;
  String dropdown2 = list2.first;
  String dropdown3 = list3.first;
  String dropdown4 = list4.first;
  String dropdown5 = list5.first;
  String dropdown6 = list6.first;
  String dropdown7 = list7.first;
  String dropdown8 = list8.first;
  String dropdown9 = list9.first;
  String dropdown10 = list10.first;
  Future<String?> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userType');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          child: Column(

            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width,

                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0,left: 10,right: 10),
                  child: Column(
                    children: [
                      Text("Identifying your skin type",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),

                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text("If you have ever tried to find the perfect foundation,you",style: GoogleFonts.poppins(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),
                      ),
                     Text("might have heard of the Fitzpatrick test.",style: GoogleFonts.poppins(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color:  Color.fromRGBO(86, 128, 227, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),

                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("What color are your eyes?",style: GoogleFonts.poppins(fontSize: 15),),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      DropdownMenu<String>(
                        initialSelection: list1.first,
                        width: MediaQuery.of(context).size.width*0.90,

                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdown1 = value!;
                          });
                        },
                        dropdownMenuEntries: list1.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);

                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                                width : MediaQuery.of(context).size.width*0.8955,
                                child: Text("What is your natural hair color ?",style: GoogleFonts.poppins(fontSize: 15),)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      DropdownMenu<String>(
                        initialSelection: list2.first,
                        width: MediaQuery.of(context).size.width*0.90,

                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdown2 = value!;
                          });
                        },
                        dropdownMenuEntries: list2.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);

                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                                width : MediaQuery.of(context).size.width*0.8955,
                                child: Text("What is your skin color (unexposed areas)?",style: GoogleFonts.poppins(fontSize: 15),)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      DropdownMenu<String>(
                        initialSelection: list3.first,
                        width: MediaQuery.of(context).size.width*0.90,

                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdown3 = value!;
                          });
                        },
                        dropdownMenuEntries: list3.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);

                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                                width : MediaQuery.of(context).size.width*0.8955,
                                child: Text("Do you have freckles on unexposed areas?",style: GoogleFonts.poppins(fontSize: 15),)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      DropdownMenu<String>(
                        initialSelection: list4.first,
                        width: MediaQuery.of(context).size.width*0.90,

                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdown4 = value!;
                          });
                        },
                        dropdownMenuEntries: list4.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                                width : MediaQuery.of(context).size.width*0.8955,
                                child: Text("What happens when you stay too long in the sun?",style: GoogleFonts.poppins(fontSize: 15),)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      DropdownMenu<String>(
                        initialSelection: list5.first,
                        width: MediaQuery.of(context).size.width*0.90,

                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdown5 = value!;
                          });
                        },
                        dropdownMenuEntries: list5.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                                width : MediaQuery.of(context).size.width*0.8955,
                                child: Text("To what degree do you turn brown?",style: GoogleFonts.poppins(fontSize: 15),)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      DropdownMenu<String>(
                        initialSelection: list6.first,
                        width: MediaQuery.of(context).size.width*0.90,

                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdown6 = value!;
                          });
                        },
                        dropdownMenuEntries: list6.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);

                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                                width : MediaQuery.of(context).size.width*0.8955,
                                child: Text("Do you turn brown after several hours of sun exposure?",style: GoogleFonts.poppins(fontSize: 15),)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      DropdownMenu<String>(
                        initialSelection: list7.first,
                        width: MediaQuery.of(context).size.width*0.90,

                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdown7 = value!;
                          });
                        },
                        dropdownMenuEntries: list7.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);

                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                                width : MediaQuery.of(context).size.width*0.8955,
                                child: Text("How does you face react to the sun?",style: GoogleFonts.poppins(fontSize: 15),)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      DropdownMenu<String>(
                        initialSelection: list8.first,
                        width: MediaQuery.of(context).size.width*0.90,

                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdown8= value!;
                          });
                        },
                        dropdownMenuEntries: list8.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);

                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                              width : MediaQuery.of(context).size.width*0.8955,
                             child: Text("When did you last expose your body to the sun(or artificial sunlamp/tanning cream)?",style: GoogleFonts.poppins(fontSize: 15),)

                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      DropdownMenu<String>(
                        initialSelection: list9.first,
                        width: MediaQuery.of(context).size.width*0.90,

                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdown9= value!;
                          });
                        },
                        dropdownMenuEntries: list9.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);

                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                                width : MediaQuery.of(context).size.width*0.8955,
                                child: Text("Did you expose the area to be treated to the sun?",style: GoogleFonts.poppins(fontSize: 15),)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      DropdownMenu<String>(
                        initialSelection: list10.first,
                        width: MediaQuery.of(context).size.width*0.90,

                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdown10 = value!;
                          });
                        },
                        dropdownMenuEntries: list10.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);

                        }).toList(),
                      ),
                    ],
                  )

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    color:Color.fromRGBO(86, 128, 227, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: (){
                      String type;
                      if(dropdown2=="Blonde" && dropdown1=="Bllue, gray or green" && dropdown3=="Very Pale" && dropdown5=="Always burns" && dropdown6=="Hardly or not at all") {
                        type = "Type I";
                        _showMyDialog("images/img_1.png",type,context);
                      }
                      else if(dropdown2=="Sandy red" && dropdown1=="Blue" && dropdown3=="Pale with a beinge tint" && dropdown5=="Usually burns" && dropdown6 =="Sometimes tans") {
                        type = "Type II";
                        _showMyDialog("images/img_2.png",type,context);
                      }
                      else if(dropdown2=="Chestnut/Dark blonde" && dropdown1=="Dark Brown" && dropdown3=="Reddish" && dropdown5=="Burns sometimes followed by peeling" && dropdown6=="Tans mostly uniformly") {
                        type = "Type III";
                        _showMyDialog("images/img_3.png",type,context);
                      }
                      else if(dropdown2=="Medium Brown" && dropdown1=="Dark Brown" && dropdown3=="Light brown" && dropdown5=="Rare burns" && dropdown6=="Always tans") {
                        type = "Type IV";
                        _showMyDialog("images/img_4.png",type,context);
                      }
                      else if(dropdown2=="Dark brown" && dropdown1=="Dark Brown" && dropdown3=="Dark brown" && dropdown5=="Rare burns" && dropdown6=="Tans more than average") {
                        type = "Type V";
                        _showMyDialog("images/img_5.png",type,context);
                      }
                      else {
                        type = "Type VI";
                        _showMyDialog("images/img_6.png",type,context);
                      }


                    },
                    child: Text("Next Step",style: GoogleFonts.poppins(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _showMyDialog(String image, String type, BuildContext context) async {
    return showDialog<void>(

      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text('Your Skin type: $type'),
          content: SingleChildScrollView(
            child: Container(

              child: ListBody(
                children: <Widget>[
                  Image.asset(image,height: 200,width: 100,fit: BoxFit.cover,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color:Color.fromRGBO(86, 128, 227, 1),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: TextButton(
                        onPressed: ()async{
                          String? usertype = await getUserType();
                          if(usertype!=null)
                          await FirebaseFirestore.instance.collection(usertype).doc(FirebaseAuth.instance.currentUser!.email).set({
                            "Type ": type,
                             "Head":0,
                            "Body":0,
                            "Left Hand":0,
                            "Right Hand":0,
                            "Left leg":0,
                            "Right leg":0
                          });

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );

                        },
                        child: Text("Next",style: GoogleFonts.poppins(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        );
      },
    );
  }

}
