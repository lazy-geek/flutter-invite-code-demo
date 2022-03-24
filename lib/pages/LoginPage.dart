// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

final greenBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0xFF14C08D),
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(10.0));

final redBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(255, 240, 56, 117),
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(10.0));

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            iconSize: 28.0,
            color: Color(0xFF14C08D),
            padding: EdgeInsets.all(20.0),
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Please provide your number',
              style: GoogleFonts.poppins(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFF2F2F2)),
            ),
            SizedBox(
              height: 99.0,
            ),
            IntlPhoneField(
              autovalidateMode: AutovalidateMode.disabled,
              cursorColor: Color(0xFF14C08D),
              style: TextStyle(color: Color(0xFFF2F2F2)),
              dropdownIcon:
                  Icon(Icons.arrow_drop_down, color: Color(0xFF14C08D)),
              dropdownTextStyle:
                  GoogleFonts.lato(color: Color(0xFFF2F2F2), fontSize: 18.0),
              showCountryFlag: false,
              flagsButtonPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 65.0),
              dropdownIconPosition: IconPosition.trailing,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  letterSpacing: 1.25,
                  color: const Color(0xFF9D9A9A),
                ),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.9),
                errorStyle: TextStyle(
                  color: Color.fromARGB(255, 240, 56, 117),
                ),
                focusedErrorBorder: redBorder,
                errorBorder: redBorder,
                focusedBorder: greenBorder,
                enabledBorder: greenBorder,
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            SizedBox(
              height: 35.0,
            ),
            Text(
              "We will send an OTP to verify this number",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                  letterSpacing: 1.25,
                  color: Color(0xFF4F4F4F)),
            ),
            SizedBox(
              height: 65.0,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'Continue',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  letterSpacing: 1.25,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                backgroundColor: const Color(0xFF14C08D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 1.0,
                    color: Color(0xFF4F4F4F),
                    thickness: 1.0,
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
                ),
                Text(
                  'Or',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF828282),
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    letterSpacing: 1.25,
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 1.0,
                    color: Color(0xFF4F4F4F),
                    thickness: 1.0,
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 75.0,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/google.svg',
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Continue with Google',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                      letterSpacing: 1.25,
                    ),
                  ),
                ],
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                backgroundColor: Colors.black,
                side: const BorderSide(
                  color: Color(0xFF14C08D),
                  width: 2.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
