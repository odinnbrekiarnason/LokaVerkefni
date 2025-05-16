import '../Functions.dart';


List<Room> roomCreation(List<RoomType> selectedRooms, Player player) {
  selectedRooms = FloorOne().selectRandomRooms(FloorOne().completeList);
  List<Room> createdRooms = [];

  for(int i = 0; i < selectedRooms.length; i++) {
    RoomType type = selectedRooms[i];
    switch(type) {
      case RoomType.startingPoint :
        Room startRoom = Room(
            description: "Starting point of the dungeon",
            name: "Starting point",
            isThereMonster: false,
            type: RoomType.startingPoint,
            door: Door(key: player.keyItems[0], onOpen: Room.onOpen(), direction: Direction.left),
            player: player,
            id: '1',
            printMap: printRoomMap(RoomType.startingPoint, player));
        createdRooms.add(startRoom);
    }
    return createdRooms;
  }



}

List getIndexOf(List<RoomType> rooms) {
List<RoomType> indexedRoom =  [rooms[0], rooms[1], rooms[2], rooms[3], rooms[4]];
  return indexedRoom;
}