import 'package:flutter/material.dart';
import 'mark_detail.dart';
import 'mark_service.dart';
import 'mark_model.dart';

class MarksPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Журнал"),
      ),
      body: FutureBuilder(
        future: httpService.getMark(),
        builder: (BuildContext context, AsyncSnapshot<List<Mark>> snapshot) {
          if (snapshot.hasData) {
            List<Mark> marks = snapshot.data;
            return ListView(
              children: marks
                  .map(
                    (Mark mark) => ListTile(
                      title: Text(mark.mark),
                      subtitle: Text("${mark.email}"),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MarkDetail(
                            mark: mark,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
