import 'Functions.dart';

void main(){
 List test = ["banana","ananas","jarðaber","hamborger","kjúlli","cave","hamborger"];
 var returnRooms = FloorOne().completeList;

FloorOne().selectRandomRooms(returnRooms);

 print(""" 
 +--------+--------+
 |   R1   >   R2   |
 |        |        |
 +---xx---+---vv---+
 |   R3   x   R4   |
 |        |        |
 +--------+--------+
 """);

}



