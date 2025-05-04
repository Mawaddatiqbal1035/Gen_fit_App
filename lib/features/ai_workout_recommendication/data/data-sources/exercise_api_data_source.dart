import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/exercise_data_model.dart';

class ExerciseApiDataSource {
  ExerciseApiDataSource();

  String apiKey = "AIzaSyDc-LKrG1sPU6L9v31kXizSIflj8-GkHWQ";

  Future<ExerciseDataModel> fetchYouTubeVideo(String query) async {
    try {
      String url = "https://www.googleapis.com/youtube/v3/search"
          "?part=snippet"
          "&q=${Uri.encodeQueryComponent(query)} workout exercise tutorial"
          "&maxResults=500"
          "&type=video"
          "&key=$apiKey";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
     print(jsonData);
     print('print api data');
        return ExerciseDataModel.toJson(jsonData);
      }
      else
      {
        throw Exception(response.statusCode);
      }
    }catch(e){
      throw Exception(e);
    }
    }
  }