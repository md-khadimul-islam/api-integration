import 'package:flutter/material.dart';
import 'package:full_api_integration/providers/post_provider.dart';
import 'package:full_api_integration/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<PostProvider>(context, listen: false).getData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Api Test')),
      body: Consumer<PostProvider>(
        builder: (context, post, child) {
          return ListView.builder(
            itemCount: post.postList.length,
            itemBuilder: (context, index) {
              final item = post.postList[index];
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Utils.screenHeight * 0.02,
                    vertical: Utils.screenHeight * 0.01),
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
                              color: Colors.black, // Adjust color as needed
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
                              color: Colors.black, // Adjust color as needed
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
        },
      ),
    );
  }
}
