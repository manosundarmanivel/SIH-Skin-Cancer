import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:novalabs/UserType.dart';
class GoogleSignin extends StatefulWidget {
  const GoogleSignin({super.key});

  @override
  State<GoogleSignin> createState() => _GoogleSigninState();
}

class _GoogleSigninState extends State<GoogleSignin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 350),
          child: Column(
            children: [

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(
                      "N",
                      style: GoogleFonts.aBeeZee(
                          textStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                    ),
                    Image.asset(
                      "images/nova.png",
                      height: 30,
                      width: 30,
                    ),
                    Text("va",
                        style: GoogleFonts.kanit(
                          textStyle: TextStyle(fontSize: 25),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "l",
                        style: GoogleFonts.sacramento(
                          textStyle: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "a",
                        style: GoogleFonts.sacramento(
                          textStyle: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "bs",
                        style: GoogleFonts.sacramento(
                          textStyle: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 270,
                  child: OutlinedButton(

                    child: Row(
                      children: [
                        Image.asset('images/google.png',height: 30,width: 30,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Sign in with google",style: GoogleFonts.roboto(fontSize: 20,color: Colors.black),),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),

                    onPressed: (){
                      signInwithGoogle();
                    },
                  ),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  signInwithGoogle()async{
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleuser = await googleSignInAccount?.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleuser?.accessToken,
      idToken: googleuser?.idToken
    );
    UserCredential user = await FirebaseAuth.instance.signInWithCredential(authCredential);
    if(user!=null)
      {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserType(),
          ),
        );
      }
  }
}
