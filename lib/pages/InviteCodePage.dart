// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_invite_code_demo/pages/LoginPage.dart';
import 'package:flutter_invite_code_demo/widgets/ErrorToast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteCodePage extends StatefulWidget {
  const InviteCodePage({Key? key}) : super(key: key);

  @override
  _InviteCodePageState createState() => _InviteCodePageState();
}

class _InviteCodePageState extends State<InviteCodePage> {
  late TextEditingController code;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    code = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 95.0,
            ),
            Text(
              'Continue with Invite Code',
              style: GoogleFonts.poppins(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 99.0,
            ),
            TextField(
              controller: code,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                letterSpacing: 1.25,
                color: Colors.white,
              ),
              cursorColor: const Color(0xFF14C08D),
              decoration: InputDecoration(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.9),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF14C08D),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF14C08D),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF14C08D),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                hintText: 'Add Invite Code',
                hintStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  letterSpacing: 1.25,
                  color: const Color(0xFF9D9A9A),
                ),
              ),
            ),
            SizedBox(
              height: 119.0,
            ),
            OutlinedButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                CollectionReference _collectionRef =
                    FirebaseFirestore.instance.collection('invites');
                QuerySnapshot isValid = await _collectionRef
                    .where('code',
                        isEqualTo: int.parse(code.text == '' ? '0' : code.text))
                    .get();
                print(isValid.size >= 1);
                setState(() {
                  _isLoading = false;
                });
                if (isValid.size >= 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                } else {
                  FToast().init(context).showToast(
                      gravity: ToastGravity.TOP,
                      positionedToastBuilder: (context, child) {
                        return Positioned(
                          child: child,
                          top: MediaQuery.of(context).viewPadding.top,
                          left: 0,
                        );
                      },
                      child: ErrorToast());
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : Text(
                        'Continue',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                          letterSpacing: 1.25,
                        ),
                      ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFF14C08D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 240.0,
            ),
            Text(
              'No invite code?',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  letterSpacing: 1.25,
                  color: Color(0xFFF2F2F2)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text.rich(
              TextSpan(
                text:
                    "If you want an invite code and get early access, please fill out ",
                children: [
                  TextSpan(
                      text: 'this form',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          // letterSpacing: 1.25,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0)),
                  WidgetSpan(
                      child: Icon(
                    Icons.open_in_new_rounded,
                    size: 14.0,
                    color: Colors.white,
                  ))
                ],
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  letterSpacing: 1.25,
                  color: Color(0xFFE0E0E0),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
