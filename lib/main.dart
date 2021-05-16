import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';

// class MainScreen extends StatelessWidget {
//   String _email;
//   String _password;
//   final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);
//   final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);
//   final formKey = new GlobalKey<FormState>();
//   BuildContext _context;

//   @override
//   Widget build(BuildContext context) {
//     _context = context;
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       darkTheme: ThemeData.dark(),
//       home: new Scaffold(
//         appBar: AppBar(title: Text('Авторизация')),
//         body: new Center(
//           child: new Form(
//               key: formKey,
//               child: new Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   new Container(
//                     child: new TextFormField(
//                       decoration: new InputDecoration(labelText: "Email"),
//                       keyboardType: TextInputType.emailAddress,
//                       maxLines: 1,
//                       style: _sizeTextBlack,
//                       onSaved: (val) => _email = val,
//                       validator: (val) =>
//                           !val.contains("@") ? 'Not a valid email.' : null,
//                     ),
//                     width: 400.0,
//                   ),
//                   new Container(
//                     child: new TextFormField(
//                       decoration: new InputDecoration(labelText: "Password"),
//                       obscureText: true,
//                       maxLines: 1,
//                       validator: (val) =>
//                           val.length < 6 ? 'Password too short.' : null,
//                       onSaved: (val) => _password = val,
//                       style: _sizeTextBlack,
//                     ),
//                     width: 400.0,
//                     padding: new EdgeInsets.only(top: 10.0),
//                   ),
//                   new Padding(
//                     padding: new EdgeInsets.only(top: 25.0),
//                     child: new MaterialButton(
//                       onPressed: submit,
//                       color: Theme.of(context).buttonColor,
//                       height: 50.0,
//                       minWidth: 150.0,
//                       child: new Text(
//                         "LOGIN",
//                         style: _sizeTextWhite,
//                       ),
//                     ),
//                   )
//                 ],
//               )),
//         ),
//       ),
//     );
//   }

//   void submit() {
//     final form = formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       performLogin();

//     }
//   }

//   void performLogin() {
//     hideKeyboard();
//     Navigator.push(
//         _context,
//         new MaterialPageRoute(
//             builder: (context) => new Mark(_email, _password)));
//   }

//   void hideKeyboard() {
//     SystemChannels.textInput.invokeMethod('TextInput.hide');
//   }
// }

class Mark extends StatefulWidget {
  // String _email;
  // String _password;
  // final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);

  // Mark(String email, String password) {
  //   _email = email;
  //   _password = password;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Оценки')),
      body: Center(
          // child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     child: Text('Назад'))
          ),
    );
  }

  @override
  Mark_widget createState() => Mark_widget();
}

class Mark_widget extends State<Mark> {
  List data;
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://apijournal20210428010114.azurewebsites.net/api/marks"),
        headers: {"Accept": "application/json"});

    setState(() {
      data = json.decode(response.body);
    });
    return "Success";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Журнал"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () => {},
          ),
        ],
      ),
      body: Center(
        child: getList(),
      ),
    );
  }

  Widget getList() {
    if (data == null || data.length < 1) {
      return Container(
        child: Center(
          child: Text("Пожалуйста подождите..."),
        ),
      );
    }
    return ListView.separated(
      itemCount: data?.length,
      itemBuilder: (BuildContext context, int index) {
        return getListItem(index);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget getListItem(int i) {
    if (data == null || data.length < 0) return null;
    return SingleChildScrollView(
      padding: EdgeInsets.all(1.0),
      scrollDirection: Axis.vertical,
      child: new Column(
        children: <Widget>[
          new Text("Оценка:"),
          new Text(data[i]['Mark'].toString()),
          new Text("Дата оценки:"),
          new Text(data[i]['Date_mark'].toString()),
          new Text("Почта:"),
          new Text(data[i]['email'].toString()),
          new Text("Дисциплина:"),
          new Text(data[i]['discipline'].toString()),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Mark(),
        // '/mark': (BuildContext context) => Mark()
      }));
}
