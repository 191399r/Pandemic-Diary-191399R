import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_firestoreapp/model/book.dart';

class FirestoreService {
  // Create a CollectionReference called bookCollection that references   // the firestore collection
  final CollectionReference bookCollection =
      FirebaseFirestore.instance.collection('books');
  Future<void> addBookData(String bookAuthor, String bookTitle,
      String bookDescription, DateTime datetime) async {
    var docRef = FirestoreService().bookCollection.doc();
    print('add docRef: ' + docRef.id);
    var time = new DateTime.now();
    await bookCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'author': bookAuthor,
      'title': bookTitle,
      'description': bookDescription,
      'datetime': time
    });
  } //addBookData

  Future<List<Book>> readBookData() async {
    List<Book> bookList = [];
    QuerySnapshot snapshot = await bookCollection.get();
    snapshot.docs.forEach((document) {
      Book book = Book.fromMap(document.data());
      bookList.add(book);
    });
    print('Booklist: $bookList');
    return bookList;
  } //readBookData

  Future<void> deleteBookData(String docId) async {
    bookCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  } //deleteBookData

  //for your reference
  Future<void> updateBookData(
      String bookAuthor, String bookTitle, String bookDescription) async {
    var docRef = FirestoreService().bookCollection.doc();
    print('update docRef: ' + docRef.id);
    await bookCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'author': bookAuthor,
      'title': bookTitle,
      'description': bookDescription
    });
  } //updateBookData

  //for your reference
  Future<void> deleteBookDoc() async {
    await bookCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } //deleteBookDoc
} //FirestoreService
