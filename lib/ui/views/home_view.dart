import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;    return Container(
      color: Colors.pink,
      child: Column(
        children: [
          // Container(
          //   color: Colors.blueAccent,
          //   width: size.width,
          //   height: 80,
          // ),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Container(
              color: Colors.amber,
              width: size.width * 9.8/10,
              height: size.height * 3.3/5,
            ),
          ),
          Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Home',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 80,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}