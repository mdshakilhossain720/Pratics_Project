
import 'package:pratics_project/data/commentMOdel.dart';
import 'package:http/http.dart'as http;

class GetApiServices {
  Future<List<CommentModel>?>getCommentModel() async {
    var data=http.Client();
    var uri=Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var response=await data.get(uri);
    if(response.statusCode==200){
      var json=response.body;
      return commentModelFromJson(json);
    }
    return null;
  }



}