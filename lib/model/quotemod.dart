class Quote {
  String uid;
  String author;
  String quote;
  Quote({this.uid, this.author, this.quote});
  Quote.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    author = data['Author'];
    quote = data['Quote'];
  }
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'author': author, 'quote': quote};
  }
}
