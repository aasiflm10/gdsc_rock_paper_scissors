import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_try_stone_paper_scissors/game.dart';

import '../widgets/button.dart';
import 'newScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width/2 - 40;
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Rock Paper Scissors'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Score', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32)
                  ),
                  Text(
                    "${Game.gameScore}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],

              ),
            ),

            SizedBox(
              height: 100,
            ),
            Container(

              width: double.infinity,
              height: MediaQuery.of(context).size.height/2,
              child: Center(
                child: Row(

                  children: [
                    gameBtn(() {
                      print("you chose scissors");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GameScreen(GameChoice("Scissors")),
                        ),
                      );
                    }, "assets/scissor_btn.png"),
                    gameBtn(() {
                      print("you chose Rock");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GameScreen(GameChoice("Rock")),
                        ),
                      );
                    }, "assets/rock_btn.png"),
                    gameBtn(() {
                      print("you chose Paper");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GameScreen(GameChoice("Paper")),
                        ),
                      );
                    }, "assets/paper_btn.png"),


                  ],
                )
              ),
            )
          ],
        )
    );
  }
}
