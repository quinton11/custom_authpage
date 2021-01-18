import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    var signinpressed = false;
    var signuppressed = false;

    final Shader lineargradient = LinearGradient(
      colors: <Color>[
        Color.fromRGBO(193, 105, 185, 1),
        Color.fromRGBO(193, 105, 185, 1),
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    final Shader lineargradient2 = LinearGradient(
      colors: <Color>[
        Color.fromRGBO(171, 62, 141, 1),
        Color.fromRGBO(171, 62, 141, 1),
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(129, 25, 86, 1),
              Color.fromRGBO(171, 62, 141, 1),
              Color.fromRGBO(193, 105, 185, 1),
            ],
            stops: [0.1, 0.6, 0.9],
          ),
          //color: Colors.tealAccent,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 150,
              left: 20,
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        foreground: Paint()..shader = lineargradient,
                        //color: Colors.white,
                        fontSize: 64,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          signinpressed = !signinpressed;
                        });
                      },
                      child: Icon(
                        signinpressed
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: signinpressed ? 550 : 250,
              left: 20,
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        foreground: Paint()..shader = lineargradient2,
                        fontSize: 64,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          signuppressed = !signuppressed;
                        });
                      },
                      child: Icon(
                        signuppressed
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
