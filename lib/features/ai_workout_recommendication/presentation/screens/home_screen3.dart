/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gen_fit/core/utils/app_constants/colors/app_colors.dart';
import 'package:gen_fit/features/ai_workout_recommendication/data/data-sources/exercise_api_data_source.dart';
import 'package:gen_fit/features/ai_workout_recommendication/domain/repositories/exercise_repository.dart';
import 'package:gen_fit/features/ai_workout_recommendication/domain/usecase/exercise_usecase.dart';
import 'package:gen_fit/features/ai_workout_recommendication/presentation/controllers/exercise_fetch_controller.dart';
import 'package:gen_fit/features/ai_workout_recommendication/presentation/widgets/home_screen_drawer_widget.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

import '../controllers/camera_controller_pick_image.dart';
import '../controllers/gemini_controller.dart';

class HomeScreen3 extends StatefulWidget {
  @override
  _HomeScreen3State createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  bool isLoading = false;
  List<Map<String, String>> videos = [];
final exerciseFtechController=Get.put(ExerciseFetchController());
  final geminiController = GeminiController(
    cameraControllerPickImage: CameraControllerPickImage(),
  );
  final cameraController = Get.put(CameraControllerPickImage());

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return Scaffold(
      drawer: HomeScreenDrawerWidget(),
      backgroundColor: Color(0xFFEEECEC),
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              "Home",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: s.width * 0.03 + s.height * 0.020,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "All Workouts",
                    style: TextStyle(
                        fontSize:s.width * 0.03 + s.height * 0.020,
                        color: AppColors.lightOnContainer
                    )
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(s.width * 0.38, s.height * 0.05),
                  ),
                  child: Text(
                    "Recommended",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Display Image if Selected
            if (cameraController.file != null) ...[
              Center(
                child: Container(
                  height: 60,
                  child: Image.file(
                    File(cameraController.file!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],

            // Video List
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : exerciseFtechController.weatherEntity.value!.videoId.isEmpty
                  ? Center(child: Text("No Recommended Videos",style: TextStyle(color: AppColors.lightOnContainer),))
                  : ListView.builder(
                itemCount: exerciseFtechController.weatherEntity.value?.videoId.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Image.network(
                          exerciseFtechController.weatherEntity.value?.thumbnails,
                          width: s.width * 0.8,
                          height: s.height * 0.25,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                         exerciseFtechController.weatherEntity.value!.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: exerciseFtechController.weatherEntity.value?.videoId,
                            flags: YoutubePlayerFlags(autoPlay: false),
                          ),
                          showVideoProgressIndicator: true,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Image Selection & Camera Buttons
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: "Create Your Picture",
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: s.width * 0.014 + s.height * 0.012,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: exerciseFtechController.getExercise,
                        icon: Icon(Icons.camera_alt_rounded,color: Colors.black,),
                      ),
                      IconButton(
                        onPressed: exerciseFtechController.getExercise,
                        icon: Icon(Icons.photo,color: Colors.black,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImageFromCameraAndAccessData() async {
    await cameraController.pickImage(ImageSource.camera);
    setState(() {}); // UI update

    if (cameraController.file == null) {
      showNoImageSelectedPopup();
      return;
    }

    setState(() => isLoading = true); // Start Loading Indicator

    await Future.delayed(Duration(seconds: 1)); // Ensure face detection completes

    print(" Checking faces: ${cameraController.faces}"); // Debugging

    if (cameraController.faces.isEmpty) {
      setState(() {
        isLoading=false;
      });
      print(" No human face detected!");
      Get.snackbar("Error", "No human face detected", snackPosition: SnackPosition.TOP);
      return;
    }

    //  Face detect hua, ab Gemini AI call ho ga
    String exercise = await geminiController.getExerciseRecommendation();
    await fetchYouTubeVideos(exercise);
  }

  pickImageFromGalleryAndAccessData() async {
    await cameraController.pickImage(ImageSource.gallery);
    setState(() {}); // UI update

    if (cameraController.file == null) {
      showNoImageSelectedPopup();
      return;
    }

    setState(() => isLoading = true); // Start Loading Indicator

    await Future.delayed(
        Duration(seconds: 1)); // Ensure face detection completes

    print(" Checking faces: ${cameraController.faces}"); // Debugging

    if (cameraController.faces.isEmpty) {
      setState(() {
        isLoading = false;
      });
      print("No human face detected!");
      Get.snackbar(
          "Error", "No human face detected", snackPosition: SnackPosition.TOP);
      return;
    }

    // Face detect hua, ab Gemini AI call ho ga
    String exercise = await geminiController.getExerciseRecommendation();
    await fetchYouTubeVideos(exercise);
  }


  // Function to Show "No Image Selected" Popup
  void showNoImageSelectedPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("No Image Selected"),
          content: Text("Please select an image first."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
  Future<void> fetchYouTubeVideos(String exercise) async {
    String apiKey = "AIzaSyAZ-xy21dRcNUCEOqxFbNw1paI4K1phkms";
    String formattedQuery = "$exercise of fitness gim workouts every person have different exercise of fitness";  // 👈 Ensure relevant videos
    String url =
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$formattedQuery&type=video&maxResults=200&key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("YouTube API Response: ${jsonData}");

      if (jsonData["items"].isNotEmpty) {
        List<Map<String, String>> fetchedVideos = [];

        for (var video in jsonData["items"]) {
          if (video["id"].containsKey("videoId")) {
            fetchedVideos.add({
              "videoId": video["id"]["videoId"],
              "title": video["snippet"]["title"],
              "thumbnail": video["snippet"]["thumbnails"]["high"]["url"],
            });
          }
        }

        setState(() {
          videos = fetchedVideos;
          isLoading = false;
        });

        print("Fetched videos: ${videos.length}");
      } else {
        print(" No videos found.");
        setState(() => isLoading = false);
      }
    } else {
      print(" Failed to fetch videos: ${response.body}");
      setState(() => isLoading = false);
    }
  }

}*/
