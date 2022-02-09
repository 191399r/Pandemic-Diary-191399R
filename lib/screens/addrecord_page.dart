import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
void inputData() {
  final User user = auth.currentUser;
  final uid = user.uid;
  // here you write the codes to input the data into firestore
}

class AddRecordPage extends StatefulWidget {
  @override
  _AddRecordPageState createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  String bookAuthor;
  String bookTitle;
  String bookDescription;
  var time = new DateTime.now();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saving Current Mood'), actions: <Widget>[]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Current Mood'),
                  validator: (val) =>
                      val.length == 0 ? "Enter your current mood" : null,
                  onSaved: (val) => this.bookAuthor = val,
                ),
                // TextFormField(
                //   keyboardType: TextInputType.text,
                //   decoration: InputDecoration(labelText: 'Book Title'),
                //   validator: (val) =>
                //       val.length == 0 ? 'Enter Book Title' : null,
                //   onSaved: (val) => this.bookTitle = val,
                // ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Current Thoughts'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter your thoughts' : null,
                  onSaved: (val) => this.bookDescription = val,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Save Record'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    FirestoreService()
        .addBookData(bookAuthor, bookTitle, bookDescription, time);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
    setState(() {});
  } //_submit
} //_AddRecordPageState
