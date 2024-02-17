import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:stories/flow/story_feed/model/story.dart';
class StoryDb {
  static const storiesCollection = 'Stories';
  static const imagesCollection = 'Images';
  FirebaseFirestore firestore = FirebaseFirestore.instance;  
  FirebaseStorage storage = FirebaseStorage.instance;
  late Reference imageStorageRef;
  late CollectionReference<Map<String,dynamic>> storiesCollectionRef;
  
  static StoryDb? _instance;  
  StoryDb._internal(){
    imageStorageRef = storage.ref().child(imagesCollection);
    storiesCollectionRef = firestore.collection(storiesCollection);
  }
  factory StoryDb(){
    return _instance ??= StoryDb._internal();
  }

  Future<String> insertStory(Story story)async{
    final documentReference = await firestore.collection(storiesCollection).add(story.toMap());
    return documentReference.id;
  }

  Future<List<Story>> fetchStories({required String category}) async{
    QuerySnapshot<Map<String , dynamic>> querySnapshot;
    if(category.isEmpty){
      querySnapshot = await storiesCollectionRef.get();
    }else{
      querySnapshot = await storiesCollectionRef.where(Story.categoryKey,isEqualTo: category).get();
    }
    List<Story> stories = querySnapshot.docs.map((map) => Story.fromMap(map.data())).toList().reversed.toList();
    return stories;
  }  

  Future<String> uploadImage(Uint8List bytes , String id) async{
    TaskSnapshot task = await imageStorageRef.child(id).putData(bytes);
    String downloadUrl = await task.ref.getDownloadURL();
    return downloadUrl;
  }
}