import 'package:coffee/Constants/colors.dart';
import 'package:coffee/main.dart';
import 'package:flutter/material.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  @override
  Widget build(BuildContext context) {

    return Align( 
      alignment: Alignment.bottomCenter,
      child: Container(
        height:screenHeight * 0.4 , 
        width: screenWidth,
        color: kBottomWidgetBackGroundColors, 
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 150),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container( 
                  height: 50, 
                  width: screenWidth *0.4, 
                  decoration: BoxDecoration(
                    color: kButtonLoginColor, 
                    borderRadius: BorderRadius.circular(20), 
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(1, 3), 
                        blurRadius: 10, 
                        spreadRadius: 1,
                        color: Colors.black.withOpacity(0.4) 
                      )
                    ]
                  ),
                  child: const Center(child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
            ), 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container( 
                  height: 40, 
                  width: screenWidth *0.4, 
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(20), 
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 3), 
                        blurRadius: 10, 
                        spreadRadius: 1,
                        color: Colors.black.withOpacity(0.4) 
                      )
                    ]
                  ),
                  child: const Center(child: Text('SignUp', style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}