import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorToast extends StatefulWidget {
  const ErrorToast({Key? key}) : super(key: key);

  @override
  _ErrorToastState createState() => _ErrorToastState();
}

class _ErrorToastState extends State<ErrorToast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text(
        'Invalid code. Please try again',
        style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
            color: Color(0xFFF2F2F2)),
      ),
      color: Color(0xFFEB5757),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
    );
  }
}
