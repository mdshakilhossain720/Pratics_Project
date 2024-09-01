import 'package:flutter/material.dart';
import 'package:pratics_project/data/commentMOdel.dart';
import 'package:pratics_project/data/services/get_api_serivices.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CommentModel> commentmodel = [];

  getComment() {
    GetApiServices().getCommentModel().then((value) {
      setState(() {
        commentmodel = value!;
      });
    });
  }

  @override
  void initState() {
    getComment();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("GetApi"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: commentmodel.length,
          itemBuilder: (context, index) {
            final apidata = commentmodel[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                      children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[300],
                  child: Text(
                    apidata.id.toString(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/1.60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          apidata.name.toString(),
                          maxLines: 2,
                          style: TextStyle(
              
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
              
                          ),
                        ),
                        Text(
                          apidata.body.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          apidata.email.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
              
              ])),
            );
          }),
    );
  }
}
