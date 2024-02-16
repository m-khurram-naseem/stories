import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stories/story_feed/model/story.dart';
class StoryDb {
  static const storiesCollection = 'Stories';
  FirebaseFirestore firestore = FirebaseFirestore.instance;  
  
  static StoryDb? _instance;  
  StoryDb._internal();
  factory StoryDb(){
    return _instance ??= StoryDb._internal();
  }

  Future<String> insertStory(Story story)async{
    try{
      await firestore.collection(storiesCollection).add(story.toMap());
    }on FirebaseException catch(e){
      return e.code;
    }
    return 'Success';
  }

  // Future<List<Story>> fetchStories() async{
  //   final querySnapshot = await firestore.collection(storiesCollection).get();
  //   List<Story> stories = querySnapshot.docs.map((map) => Story.fromMap(map)).toList();
  // }
}