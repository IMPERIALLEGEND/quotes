import 'package:flutter/material.dart';
import 'quote.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        text: "The moment you give up is the moment you let someone else win.",
        author: "Kobe Bryant"),
    Quote(
        text:
            "A positive mind looks for ways it can be done; a negative mind looks for ways it can't be done.",
        author: "Napoleon Hill"),
    Quote(
        text: "Every morning we are born again. What we do today matters most.",
        author: "Steve Jobs")
  ];

  Widget quoteTemplate(quote) {
    return QuoteCard(
        quote: quote,
        delete: () {
          setState(() {
            quotes.remove(quote);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => quoteTemplate(quote)).toList(),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 10, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.text,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(quote.author,
                style: TextStyle(fontSize: 14, color: Colors.grey[800])),
            SizedBox(
              height: 8,
            ),
            FlatButton.icon(
                onPressed: delete,
                label: Text("Delete Quote"),
                icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
