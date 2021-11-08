import 'dart:convert';
import 'package:dependency_inject_fl/constant/const.dart';
import 'package:dependency_inject_fl/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostApi {
  
  Future<List<PostModel?>?> getInitialPostData() async {
  
    final responseData = await http.get(
  
      Uri.parse(baseUrl + urlHeader),
  
    );

    if (responseData.statusCode == 200) {
  
      final parsed =
  
          json.decode(responseData.body).cast<Map<String, dynamic>>();

      return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
  
    } else {
  
      throw Exception('Failed to load album');
  
    }
  
  }

}

