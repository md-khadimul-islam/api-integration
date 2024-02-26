import 'package:flutter/material.dart';
import 'package:full_api_integration/providers/post_provider.dart';
import 'package:full_api_integration/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../models/post_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Api Test')),
      body: StreamBuilder<List<PostModel>>(
        stream: Provider.of<PostProvider>(context).postDataStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final postList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                final item = postList[index];
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Utils.screenHeight * 0.02,
                    vertical: Utils.screenHeight * 0.01,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.id!.toString()),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Title:\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: item.title!.toString(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Utils.screenHeight * 0.02),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Description:\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: item.body!.toString(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}