import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_app/view%20models/feed_view_model.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context);
    feedViewModel.initializeController();
    feedViewModel.getData();

    return Scaffold(
      body: feedViewModel.userList != null
          ? ListView.builder(
              controller: feedViewModel.controller,
              itemCount: feedViewModel.userList.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "product Name: - ${feedViewModel.userList[i].name} ",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "product price: - ${feedViewModel.userList[i].price} ",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Text(
                      "Category :- ${feedViewModel.userList[i].category} ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Desc :- ${feedViewModel.userList[i].description} ",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                );
              },
            )
          : Container(
              child: Center(
                child: SpinKitThreeBounce(
                  color: Colors.orange,
                  size: 20,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          feedViewModel.navigateToAddProduct();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
