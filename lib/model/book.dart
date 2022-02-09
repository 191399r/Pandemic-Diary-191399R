import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  String uid;
  String author;
  String title;
  String description;
  Timestamp datetime;
  Book({this.uid, this.author, this.title, this.description, this.datetime});
  Book.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    author = data['author'];
    title = data['title'];
    description = data['description'];
    datetime = data['datetime'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'author': author,
      'title': title,
      'description': description,
      'datetime': datetime
    };
  }
}
