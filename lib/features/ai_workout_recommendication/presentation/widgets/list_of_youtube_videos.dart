/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gen_fit/features/ai_workout_recommendication/presentation/widgets/video_data.dart';

class ListOfYoutubeVideos extends StatelessWidget {
  final List<int> list;
  ListOfYoutubeVideos({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder( itemBuilder:(context,index){
      return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(onTap:()=> Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=> VideoData(url:'https://youtube.com/embed/${list[index]}[contentDetails][videoId]'))),
                child: Container(
                  decoration: BoxDecoration(
                    image:DecorationImage(image: NetworkImage(list[index]),
                        fit:BoxFit.cover )
                  ),
                ),),
              ],
            ),
          ),
      );
    },itemCount: list.length,);
  }
}*/
