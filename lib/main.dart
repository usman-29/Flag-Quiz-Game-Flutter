import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_app/game_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: darkMode == true ? Colors.grey[850] : Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return GamePage(
                      darkMode: darkMode,
                    );
                  }));
                });
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: darkMode == true ? Colors.grey[850] : Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: darkMode == true
                          ? const Color(0xFF212121)
                          : const Color(0xFF9E9E9E),
                      offset: const Offset(5, 5),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: darkMode == true
                          ? const Color(0xFF424242)
                          : Colors.white,
                      offset: const Offset(-5, -5),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Play",
                    style: TextStyle(
                      color: darkMode == true ? Colors.white : Colors.black,
                      fontSize: 26,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        darkMode = false;
                      });
                    },
                    color: Colors.white,
                    child: const Text(
                      "Light",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        darkMode = true;
                      });
                    },
                    color: Colors.black,
                    child: const Text(
                      "Dark",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
