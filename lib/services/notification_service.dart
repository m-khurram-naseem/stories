import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stories/models/app_notification.dart';
import 'package:stories/services/access_token_service.dart';

abstract class ApiService {
  String get baseUrl => 'https://fcm.googleapis.com';
  String get apiUrl;
  String get url => baseUrl + apiUrl;

  Future<bool> postNotification(
      Map<String, dynamic> map, Map<String, String> header) async {
    var response =
        await http.post(Uri.parse(url), body: jsonEncode(map), headers: header);    
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}

class NotificationApiService extends ApiService with AccessTokenService {
  static const _contentTypeKey = 'Content-Type',
      _authorizationKey = 'Authorization';
  static NotificationApiService? _instance;
  NotificationApiService._internal();

  factory NotificationApiService() {
    return _instance ??= NotificationApiService._internal();
  }
  @override
  String get apiUrl => '/v1/projects/stories-backend-system/messages:send';

  Future<bool> pushNotification({
    required AppNotification notification,
  }) async {
    String token = await getAccessToken();    
    Map<String, String> headers = {
      _contentTypeKey: 'application/json',
      _authorizationKey: 'Bearer $token',
    };        
    return await postNotification(
      notification.toMap(),
      headers,
    );
  }
}
