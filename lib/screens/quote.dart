import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/model/quotemod.dart';
import 'package:firebase_firestoreapp/services/firestore_quote.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class Quotegen extends StatefulWidget {
  @override
  _QuotegenState createState() => _QuotegenState();
}

class _QuotegenState extends State<Quotegen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: FutureBuilder<List<Quote>>(
        future: FirestoreQuote().readQuoteData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 1, //snapshot.data.length,
              itemBuilder: (context, index) {
                Random random = new Random();
                var totes = snapshot.data.length;
                int randomNumber = random.nextInt(totes);
                return Container(
                    height: 300,
                    child: Card(
                      elevation: 10,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data[randomNumber].quote,
                            style: TextStyle(
                                color: Colors.green[900], fontSize: 30.0),
                          ),
                          Text(
                            snapshot.data[randomNumber].author,
                            style: TextStyle(
                                color: Colors.orange[700], fontSize: 30.0),
                          ),
                          // Column(
                          //   children: [
                          //     Text(
                          //       snapshot.data[index].quote,
                          //       style:
                          //           TextStyle(color: Colors.black, fontSize: 14.0),
                          //     ),
                          //     // Text(
                          //     //   snapshot.data[index].description,
                          //     //   style:
                          //     //       TextStyle(color: Colors.black, fontSize: 12.0),
                          //     // ),
                          //   ],
                          // ),
                          Row(
                            children: [
                              IconButton(
                                color: Colors.blue,
                                icon: Icon(Icons.refresh),
                                onPressed: () async {
                                  setState(() {});
                                },
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(10)),
                                ),
                                child: Text(
                                  "are you Alright?",
                                  style: TextStyle(
                                    height: 1.0,
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  const url =
                                      'https://stayprepared.sg/mymentalhealth/i-need-support-now/';
                                  launchURL(url);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
} //_RecordsPageState

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
