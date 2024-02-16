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
  List<PostModel> postList = [];

  Future<void> getData() async {
    await _getPostData();
  }

  Future<List<PostModel>> _getPostData() async {
    try {
      final response = await http.get(Uri.parse(Config.postUrl));
      final json = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (Map i in json) {
          postList.add(PostModel.fromJson(i));
        }
        return postList;
      } else {
        throw Exception('Failed to load post data');
      }
    } catch (error) {
      throw Exception('Failed to fetch post data: $error');
    }
  }
}
