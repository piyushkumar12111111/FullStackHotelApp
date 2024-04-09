import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserInfo(Map<String, dynamic> userData) async {
    _firestore.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  Future<QuerySnapshot> getUserInfo(String email) async {
    return _firestore
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<QuerySnapshot> searchByName(String searchField) {
    return _firestore
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .get();
  }

  Future<void> addChatRoom(Map<String, dynamic> chatRoom, String chatRoomId) async {
    _firestore
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e.toString());
    });
  }

  Stream<QuerySnapshot> getChats(String chatRoomId) {
    return _firestore
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  Future<void> addMessage(String chatRoomId, Map<String, dynamic> chatMessageData) async {
    _firestore.collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e) {
          print(e.toString());
    });
  }

  Stream<QuerySnapshot> getUserChats(String itIsMyName) {
  return _firestore
      .collection("chatRoom")
      .where('users', arrayContains: itIsMyName)
      .snapshots();
}

}
