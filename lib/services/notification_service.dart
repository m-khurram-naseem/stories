import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stories/models/story_notification.dart';

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

class NotificationApiService extends ApiService {
  static NotificationApiService? _instance;
  NotificationApiService._internal();

  factory NotificationApiService() {
    return _instance ??= NotificationApiService._internal();
  }
  @override
  String get apiUrl => '/v1/projects/stories-backend-system/messages:send';
  Map<String, String> get headers =>
      {'Content-Type': 'application/json', 'Authorization': 'Bearer MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCmDnv5jo2bjrximIgiw2pKjk0SinWmiGK38cSjCuYjk9UDcozKyodE0AQoyrk32l6+njzBzgdm0NJ5ZHjWSFH4KivWnwaAozkoqNJQEz83MCzIqVojBD1Do6z/pKcjlY80mzjOyi1wMGk1j8LO9V4e0JB7czmamF0Nvev4xwM1dI14vFAE13bH36Gbo5X5r/lHFs4tpPyYC96ZCnYuALR5E3HcGftMdqjg3n1SbJRanqsw2AvPwv37yQVcUkTvLTOUgi7E6dHrPdqz1JpuzmraKisFmidv1ExU/5HOwsJmdY8Jb8cQWxfklxaHAL6DnMil0BckHrU9kdG6\n+8EIdnAxAgMBAAECggEABQ5FLAXxEx63ZvEUmVUFyXCnsWbRyi42LeTd2HDz13rKw34bV0PvS7hhnV7+tfqfY9esKze7S0q+/b8ssVQmWr3onnIyX9GYYz/bQguJTdmDo4sJxC3UMlkAuA/VSY9mJXM3DuS3mXDVOIeV+3hw/dMvyEfBJeR5q3oa0x+MCMvl\nBFlEFYmFgD71yAO7s9Wgl2IvioRHKqqefwIO46pPgwmt8R7yvtaKyTVknKa5WR9Nk53q2HXSWyy0UwcfaEatzAF0zBiuAxMl67KePgObHJPsHtHURY89Uqe5LZEXmk6x6sS7tSm8cEwgF+n+bZZLmI+rUcXANGv7eZs5UJ6+GQKBgQDl39wDs4lJ5FVBglOHO08Ya5yWRW9OabkohSrP7n92bozKUBanuGxzM67KD7ebjEm3doRfRjCoGnEFCoQL1nCcJx7TDnpV+UzPzagYfcH/O/tFZI6JP1QWAfRD8vQOwSL+YhmUv/Rhbyyp3VO2qkmnjOwfUWEAG/19HU7w9TVsjwKBgQC47dwNLULWW/9LnfN2NVrsBJrF+P9SdDsgRZUp1UpDxRdr6dBdstZsyqwWjwB/XnTv7pEc4RJb6SmJHvwDSbxpPLrtLQ0bftYknxzG+JhLF4HcIBF3GAP9oSwrkMKpoUOnTZ1iZZlmOXhm12zAZa1M3Z/8FgDweAd4l68BBSI3PwKBgHmjbnHK9A/UskR66SY6/QyoDPD7hv2QNjk51kC3LF2H/BomLQbNMR34sDod/QNjRbK+FSexJZgefcW0HdGBxI7sqIP4OkX6KGohohxrl1cu7zR2FHKNvznyCMZX7ktMae8ADBdJR9CzGog8JMsY6uatTFj6IAEFzqoA8z/QEVgDAoGBAKK6Q8mgi1DfUU3z5pmdJ63J+3u7uMiQmLq0ICbYlen+k7aU35Kj3QWMblPHcDOkJZg/wJe+Ag64pKERj8dA6jdchkxQOVl5iexdys/XTwO84ruVyGiYzGIxohGP54um6UZeCODd8FdAuQ8d/4dpsU6TMsV7g0YXCNP3/boTD2G3AoGAbQ+CwZ1bASUH2saAMwrfHhwdmDznHzdJKf/xGRCrm5uDYJzBvxDKs+fKa4Xb02TFrtTxttMIxD84/QXHSIp8+Z0AJUFOdcsA68AEaTqs3i4AagzSR3FUT0X5u1r3u6yTVofmlWJEN+Ul9xMPca7WTMpsgegVUDGSUJniSA2uJ5U'};

  Future<bool> pushNotification(
      {required StoryNotification notification}) async {
    return await postNotification(
      notification.toMap(),
      headers,
    );
  }
}
