import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AutoComplete(),
    );
  }
}

class AutoComplete extends StatefulWidget {
  @override
  _AutoCompleteState createState() => new _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  List<String> listItems = ['apple', 'Orange', 'banana', 'grapes'];
  final TextEditingController controller = new TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  AutoCompleteTextField searchTextField;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: searchTextField = AutoCompleteTextField<String>(
      style: new TextStyle(color: Colors.black, fontSize: 16.0),
      decoration: new InputDecoration(
          suffixIcon: Container(
            width: 85.0,
            height: 60.0,
          ),
          contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
          filled: true,
          hintText: 'Search fruits',
          hintStyle: TextStyle(color: Colors.black)),
         
      itemBuilder: (context, item) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              item.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Text(
              item.toString(),
            )
          ],
        );
      },
      itemFilter: (item, query) {
        return item.toString().toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemSubmitted: (item) {
        setState(() => searchTextField.textField.controller.text = item);
      },
      key: key,
      suggestions: listItems,
    ));
  }
}
