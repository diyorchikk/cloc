import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 2,
        ));
    animationController.addListener(() {

      if(animationController.isCompleted){
        animationController.reverse();
      }else if(animationController.isDismissed){
        animationController.forward();
      }

      setState(() {

      });
    });
    animationController.forward();
    super.initState();
  }

  _currentTime() {
    return "${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}";
  }

  @override
  Widget build(BuildContext context) {
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.elasticInOut);
    animation = Tween(begin: -0.5, end: 0.5).animate(animationController);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0.0,
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.deepOrange,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: <Widget>[
              Material(
                borderRadius: const BorderRadius.all(
                  Radius.circular(50.0),
                ),
                elevation: 10.0,
                color: Colors.brown.shade900,
                child: SizedBox(
                  height: 320,
                  width: 320,
                  child: Center(
                    child: Text(
                      _currentTime(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.rotationZ(animation.value),
                alignment: const FractionalOffset(0.5, 0.2),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    "assets/images/cloc.png",
                    width: 100,
                    height: 240,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
