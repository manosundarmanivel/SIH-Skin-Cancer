import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novalabs/Patient.dart';
import 'package:novalabs/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  List<String> list = <String>['Doctor','Patient'];
  String dropdownValue = 'Doctor';
  void saveUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userType', 'Doctor');
  }
  void PatientUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userType', 'Patient');
  }
  Future<String?> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userType');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Container(
            child: Column(
              children: [
                Text("You are!",style: GoogleFonts.poppins(fontSize: 30),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownMenu<String>(
                initialSelection: list.first,
                width: MediaQuery.of(context).size.width*0.70,

                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);

                }).toList(),
              ),
            ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.5,
                      child: ElevatedButton(onPressed: (){
                        if(dropdownValue == "Patient")
                          {
                            PatientUserType();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>Patient(),
                              ),
                            );
                          }
                        else{
                            saveUserType();

                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>HomePage(),),
                            );
                        }
                      }, child: Text("Submit",style: GoogleFonts.poppins(fontSize: 20),),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
