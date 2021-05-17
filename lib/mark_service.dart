import 'dart:convert';
import 'package:http/http.dart';
import 'package:journal_mobile/mark_model.dart';
import 'mark_model.dart';

class HttpService {
  final String postsURL =
      "https://apijournal20210428010114.azurewebsites.net/api/marks";

  Future<List<Mark>> getMark() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Mark> posts = body
          .map(
            (dynamic item) => Mark.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
