import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  int counter = 0;

  void setupWorldTime() async {
    WorldTime world  = WorldTime(url: "Asia/Manila", flag: "germany.png", location: "Manila");
    await world.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": world.location,
      "flag": world.flag,
      "time": world.time,
      "isDayTime": world.isDayTime,
    });
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
        color: Colors.white,
        size: 50.0
        ),
      ),
    );
  }
}
