import 'Functions.dart';

void main(){
 var returnRooms = FloorOne().completeList;
 FloorOne().selectRandomRooms(returnRooms);
 FloorOne().enterRoom(returnRooms);

 /*print("""
 +--------+--------+
 |   R1   >   R2   |
 |        |        |
 +---xx---+---vv---+
 |   R3   x   R4   |
 |        |        |
 +--------+--------+
 """);*/

}



