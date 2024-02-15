import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'service/firebase_options.dart';
<<<<<<< HEAD
import 'service/MyApp.dart';
import 'package:http/http.dart' as http;
=======
>>>>>>> Cade

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var apiKey = "LFZKJR58QXIC3JVG";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom NavBar V2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override 
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 223, 223),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(onPressed: (){},
                    shape: CircleBorder(), 
                    backgroundColor: const Color.fromRGBO(204, 136, 0, 100), 
                    child: Icon(Icons.bookmark, color: const Color.fromRGBO(29, 74, 44, 100),), elevation: 0.1,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(icon: Icon(Icons.history), color: const Color.fromRGBO(204, 136, 0, 100),
                          onPressed: (){}, 
                        ),
                        IconButton(icon: Icon(Icons.search), color: const Color.fromRGBO(204, 136, 0, 100),
                          onPressed: (){}, 
                        ),
                        Container(width: size.width*0.20,),
                        PopupMenuButton(
                          color: const Color.fromRGBO(29, 74, 44, 100),
                          itemBuilder: (context) => [
                            _buildPopupMenuItem('History ', Icons.book),
                            _buildPopupMenuItem('Trade ', Icons.currency_exchange),
                          ],
                        ),
                        IconButton(icon: Icon(Icons.settings), color: const Color.fromRGBO(204, 136, 0, 100),
                          onPressed: (){},
                        ),
                      ], 
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

PopupMenuItem _buildPopupMenuItem(
  String name, IconData iconData) {
    return PopupMenuItem(
      child: Row(
        children: [
          Icon(iconData, color: const Color.fromRGBO(204, 136, 0, 100),),
          Text(name),
        ],
      ),
    );
  }

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color.fromRGBO(29, 74, 44, 100)..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    path.arcToPoint(Offset(size.width*0.60, 20), 
      radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, const Color.fromRGBO(204, 136, 0, 100), 5, true);
    canvas.drawPath(path, paint); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
