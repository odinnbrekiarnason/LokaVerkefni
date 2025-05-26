import 'dart:io';

import '../Functions.dart';
import 'dart:math';

class DiceRoom extends Room {
  void puzzle;
  String answer;
  int correctAnswer;

  DiceRoom({
    required super.type,
    required super.door,
    required super.player,
    required super.name,
    required super.id,
    required super.description,
    required super.printMap,
    required this.puzzle,
    required this.answer,
    required this.correctAnswer,
  });


}

void guessTheNumber(DiceRoom dice, Player player) {
  print("Hello and welcome to the puzzle room!"
      "\nThe goal is to guess the correct number"
      "\nIf you get it in 3 tries you get rewarded 2 chests!"
      "\nIf you get it in 5 tries you get 1 chest, anymore guesses than that and you only get 1 healing item."
      "\nThe highest number it can go is 20"
  );
  Random random1 = Random();
  dice.correctAnswer = random1.nextInt(20);
  List<Secondary> loserItem = [Items().secondaryItems[random1.nextInt(Items().secondaryItems.length)]];
  print("Ok you can now start guessing!");
  int i = 0;
  bool game = true;
  while(game == true) {
    String guess = stdin.readLineSync().toString();
    i++;
    int parsedGuess = 0;
    try {
      parsedGuess = int.parse(guess);
    } catch(e) {
      print("Please enter a valid number!");
    }
    if(parsedGuess > 20) {
      print("Please enter a valid number!");
    }
    else if(parsedGuess == dice.correctAnswer) {
      print("Congratulations! You guessed the correct number!");
      print("You manages to guess the correct number in $i tries!");
      switch(i) {
        case 3 :
          print("WOW You got it in 3 tries, well done you get 2 chests!!");
          Chest(item: returnItemList()).openChest(player);
          Chest(item: returnItemList()).openChest(player);
        case 5 :
          print("Nice you got it in 5 tries, you get a chest!");
          Chest(item: returnItemList()).openChest(player);
        case > 5 :
          addToBackpack(loserItem, player);
      }
    }
    else if(parsedGuess < dice.correctAnswer) {
      print("Psst... guess higher");
    }
    else if(parsedGuess > dice.correctAnswer) {
      print("Psst... guess lower");
    }
  }
}

