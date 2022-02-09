import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_firestoreapp/model/book.dart';

class FirestoreRectify {
  // Create a CollectionReference called bookCollection that references   // the firestore collection
  final Query bookCollection = FirebaseFirestore.instance
      .collection('books')
      .orderBy('datetime', descending: true);

  Future<List<Book>> readBookData() async {
    List<Book> bookList = [];
    QuerySnapshot snapshot = await bookCollection.get();
    snapshot.docs.forEach((document) {
      Book book = Book.fromMap(document.data());
      bookList.add(book);
    });
    print('Booklist: $bookList');
    return bookList;
  }
} //FirestoreService
