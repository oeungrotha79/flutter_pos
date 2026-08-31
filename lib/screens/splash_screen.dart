import 'package:flutter/material.dart';
import 'package:pos_mobile/screens/home_screen.dart';
import 'package:pos_mobile/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

bool _isScaleUp = false;

@override
void initState(){
  _init();
  super.initState();
}

void _init() async {
  await Future.delayed(Duration(milliseconds: 500));
  if(!mounted) return;
  _isScaleUp = true;
  setState(() { });
  await Future.delayed(Duration(seconds: 2));
  if(!mounted) return;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('sv11-12.pos_mobile.token');
  if(!mounted) return;
  if(token==null){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route)=> false);
  }else{
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),), (route)=> false);
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         Center(
          child: AnimatedScale(
            duration: Duration(
              milliseconds: 800
            ),
            scale: _isScaleUp ? 1.5 :1, 
          
          child: Image.asset('assets/images/Group.png', width: 60, height: 60,),
          )
         ),

         Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(child: CircularProgressIndicator.adaptive()),
         )
        ],
      ),
    );
  }
}
