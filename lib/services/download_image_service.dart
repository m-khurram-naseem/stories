import 'dart:typed_data';
import 'package:http/http.dart' as http;

class DownloadImageService{
  static DownloadImageService? _instance;
  DownloadImageService._internal();
  factory DownloadImageService(){
    return _instance ??= DownloadImageService._internal();
  }

  Future<Uint8List> downloadImageFromUrl(String url) async{
    final response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }
}