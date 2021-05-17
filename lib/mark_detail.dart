import 'package:flutter/material.dart';
import 'mark_model.dart';

class MarkDetail extends StatelessWidget {
  final Mark mark;

  MarkDetail({this.mark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mark.mark),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("${mark.mark}"),
                        subtitle: Text("Оценка"),
                      ),
                      ListTile(
                        title: Text(mark.dateMark),
                        subtitle: Text("Дата Оценки"),
                      ),
                      ListTile(
                        title: Text("${mark.email}"),
                        subtitle: Text("Почта"),
                      ),
                      ListTile(
                        title: Text("${mark.discipline}"),
                        subtitle: Text("Дисциплина"),
                      ),
                      ListTile(
                        title: Text("${mark.surnameStudent}"),
                        subtitle: Text("Фамилия"),
                      ),
                      ListTile(
                        title: Text("${mark.nameStudent}"),
                        subtitle: Text("Имя"),
                      ),
                      ListTile(
                        title: Text("${mark.patronymicStudent}"),
                        subtitle: Text("Отчество"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
