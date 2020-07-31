import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  uploadUserInfo(userMap) {
    Firestore.instance.collection("users").add(userMap);
  }

  getUserByUsername(String username) {
    return Firestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserByUserEmail(String userEmail) {
    return Firestore.instance
        .collection("users")
        .where("email", isEqualTo: userEmail)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }

  createChatRoom(String chatRoomId, chatRoomMap) {
    Firestore.instance
        .collection("ChatRoom")
        .document(chatRoomId)
        .setData(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
