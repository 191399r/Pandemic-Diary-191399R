import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_firestoreapp/model/quotemod.dart';

class FirestoreQuote {
  // Create a CollectionReference called bookCollection that references   // the firestore collection
  final CollectionReference quoteCollection =
      FirebaseFirestore.instance.collection('quotes');
  // Future<void> addQuoteData(String bookAuthor, String quote) async {
  //   var docRef = FirestoreService().quoteCollection.doc();
  //   print('add docRef: ' + docRef.id);
  //   await quoteCollection
  //       .doc(docRef.id)
  //       .set({'uid': docRef.id, 'author': bookAuthor, 'quote': quote});
  // } //addBookData

  Future<List<Quote>> readQuoteData() async {
    List<Quote> quoteList = [];
    QuerySnapshot snapshot = await quoteCollection.get();
    snapshot.docs.forEach((document) {
      Quote quote = Quote.fromMap(document.data());
      quoteList.add(quote);
    });
    print('Quotelist: $quoteList');
    return quoteList;
  } //readBookData

  // Future<void> deleteBookData(String docId) async {
  //   quoteCollection.doc(docId).delete();
  //   print('deleting uid: ' + docId);
  // } //deleteBookData

  //for your reference
  // Future<void> updateBookData(
  //     String bookAuthor, String bookTitle, String bookDescription) async {
  //   var docRef = FirestoreService().bookCollection.doc();
  //   print('update docRef: ' + docRef.id);
  //   await bookCollection.doc(docRef.id).update({
  //     'uid': docRef.id,
  //     'author': bookAuthor,
  //     'title': bookTitle,
  //     'description': bookDescription
  //   });
  // } //updateBookData

  //for your reference
  // Future<void> deleteBookDoc() async {
  //   await bookCollection.get().then((snapshot) {
  //     for (DocumentSnapshot ds in snapshot.docs) {
  //       ds.reference.delete();
  //     }
  //   });
  // } //deleteBookDoc
} //FirestoreService
