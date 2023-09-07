import 'package:coffee/Widgets/bottom_widget.dart';
import 'package:coffee/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginCoffeeScreen extends StatefulWidget {
  const LoginCoffeeScreen({super.key});

  @override
  State<LoginCoffeeScreen> createState() => _LoginCoffeeScreenState();
}

class _LoginCoffeeScreenState extends State<LoginCoffeeScreen> with TickerProviderStateMixin {

  late AnimationController _animationController; 
  bool isGreenCoffee = false; 
  bool isTextReady = false;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
  _animationController = AnimationController(vsync: this); 
  _animationController.addListener(() { 
    if(_animationController.value > 0.7){
      _animationController.stop(); 
       isGreenCoffee = true;
      setState(() {
        
      });

      Future.delayed(const Duration(seconds: 1), (){
         isTextReady = true; 
         setState(() {
           
         });
      });
    }
  });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
     screenHeight = MediaQuery.sizeOf(context).height;
      screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
         Visibility(visible: isGreenCoffee,  child: const BottomWidget()), 
         AnimatedContainer(
          height: isGreenCoffee ? (screenHeight / 1.45) : screenHeight,
          duration: const Duration(seconds: 1), 
          decoration: BoxDecoration(
            color: Colors.white, 
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 3),
                blurRadius: 25, 
                blurStyle: BlurStyle.normal,
                spreadRadius: 1,
                color: Colors.black.withOpacity(0.3))
            ], 
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(isGreenCoffee ? 25.0 : 0.0), 
              bottomRight: Radius.circular(isGreenCoffee ? 25.0 : 0.0)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedCrossFade(
                firstChild: Lottie.asset('images/greencoffee.json'),
                secondChild: Lottie.asset('images/coffeemain.json', 
                controller: _animationController, 
                height: screenHeight/2, 
                onLoaded: (compostion){
                  _animationController.duration = compostion.duration; 
                  _animationController.forward();
                }),
                crossFadeState: isGreenCoffee ? CrossFadeState.showFirst 
                : CrossFadeState.showSecond, 
                duration: const Duration(seconds: 2)), 
                Center(
                  child: AnimatedOpacity(
                    opacity: isTextReady ? 1 : 0, 
                    duration: Duration(seconds: 2), 
                  child:  Text('Coffee Cups', style: TextStyle(fontFamily: 'Lobster', fontSize: 45, color: Color(0xff674335)),),),
                )
            ],
          ),
          )
        ],
      ),
    );
  }
}