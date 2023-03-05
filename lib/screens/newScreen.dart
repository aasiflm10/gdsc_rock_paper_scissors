import 'dart:math';

import 'package:flutter/material.dart';
import 'package:second_try_stone_paper_scissors/screens/main_screen.dart';

import '../widgets/button.dart';
import '../game.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.gameChoice, {Key? key}) : super(key: key);
  GameChoice gameChoice;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String randomChoice() {
    Random random = new Random();
    int robotChoiseIndex = random.nextInt(3);
    return Game.choices[robotChoiseIndex];
  }

  @override
  Widget build(BuildContext context) {
    String robotChoice = randomChoice();

    String? robotChoicePath;
    switch (robotChoice) {
      case "Rock":
        robotChoicePath = "assets/rock_btn.png";
        break;
      case "Paper":
        robotChoicePath = "assets/paper_btn.png";
        break;
      case "Scissors":
        robotChoicePath = "assets/scissor_btn.png";
        break;
    }

    String? player_choice_path;
    switch (widget.gameChoice.type) {
      case "Rock":
        player_choice_path = "assets/rock_btn.png";
        break;
      case "Paper":
        player_choice_path = "assets/paper_btn.png";
        break;
      case "Scissors":
        player_choice_path = "assets/scissor_btn.png";
        break;
    }

    if (GameChoice.gameRules[widget.gameChoice.type]![robotChoice] ==
        "You Win") {
      setState(() {
        Game.gameScore++;
      });
    }
    
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text('Score',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32)),
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
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                gameBtn(() {}, player_choice_path!),
                Text("VS"),
                gameBtn(() {}, robotChoicePath!)
              ],
            )),
            Container(
                child: Center(
                    child: Text(
              "${GameChoice.gameRules[widget.gameChoice.type]![robotChoice]}",
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ))),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                child:
                  RawMaterialButton(
                    padding: EdgeInsets.all(24.0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(),
                          ));
                    },
                    shape: StadiumBorder(),
                    fillColor: Colors.white,
                    child: Text(
                      "Play Again",
                      style: TextStyle(
                          color: Color(0xFF060A47),
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

              ),
            )
          ],
        ));
  }
}
