class ExerciseDataModel {
  String title;
  int videoId;
  int thumbnails;
  String description;

  ExerciseDataModel({
    required this.title,
    required this.thumbnails,
    required this.videoId,
    required this.description,
  });

  factory ExerciseDataModel.toJson(Map<String,dynamic> json) {
   // var items = json['items'] as List<dynamic>?; // Ensure 'items' is a list
  //  if (items == null || items.isEmpty) {
     // throw Exception("No items found in JSON data");
   // }

   // var snippet = items[0]['snippet'] as Map<String, dynamic>? ?? {};
    //var id = items[0]['id'] as Map<String, dynamic>? ?? {};

    return ExerciseDataModel(
      title: json["snippet"]["title"]?.toString() ?? "",
      thumbnails: json["snippet"][0]['thumbnails']?? 0,
      description: json["snippet"]["description"]?.toString() ?? "",
      videoId:json['items'][0]["videoId"]?? 0,
    );
  }
}
