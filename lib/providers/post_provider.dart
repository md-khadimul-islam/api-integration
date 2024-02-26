import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:full_api_integration/utils/config.dart';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

// class PostProvider extends ChangeNotifier {
//   List<PostModel> postList = [];
//
//   Future<List<PostModel>> _getPostData() async {
//     try {
//       final response = await http.get(Uri.parse(Config.postUrl));
//       final json = jsonDecode(response.body.toString());
//       if (response.statusCode == 200) {
//         for (Map i in json) {
//           postList.add(PostModel.fromJson(i));
//         }
//         return postList;
//       }
//       else {
//         return postList;
//       }
//     } catch (error) {}
//   }
// }

class PostProvider extends ChangeNotifier {
  final StreamController<List<PostModel>> _postStreamController = StreamController<List<PostModel>>();

  Stream<List<PostModel>> get postDataStream => _postStreamController.stream;

  void fetchData() async {
    try {
      final response = await http.get(Uri.parse(Config.postUrl));
      if (response.statusCode == 200) {
        final List<PostModel> posts = (json.decode(response.body) as List)
            .map((data) => PostModel.fromJson(data))
            .toList();
        _postStreamController.add(posts);
      } else {
        throw Exception('Failed to load post data');
      }
    } catch (error) {
      throw Exception('Failed to fetch post data: $error');
    }
  }

  @override
  void dispose() {
    _postStreamController.close();
    super.dispose();
  }
}