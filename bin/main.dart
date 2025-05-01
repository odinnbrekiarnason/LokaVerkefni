import 'Functions.dart';

void main(){
 List test = ["banana","ananas","jarðaber","hamborger","kjúlli","cave","hamborger"];
FloorOne().selectRandomRooms(FloorOne().completeList);
print(""" 
+-----+-----+-----+
|  A  -  B  -  C  |
+-----+--|--+-----+
+-----+--|--+-----+
|  A  |  B  -  C  |
+--|--+--|--+-----+
+--|--+--|--+-----+
|  A  |  B  ?  C  |
+-----+-----+-----+

""");
}