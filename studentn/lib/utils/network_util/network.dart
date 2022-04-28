import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../models/register_device_request_model.dart';
import '../constans/urls.dart';

class WebService {
  static registerDevice(RegisterDeviceRequestModel registerDeviceRequestModel,
   ) async {
    final prefs = await SharedPreferences.getInstance();
    final response =
        await http.post(Uri.https(Urls.BASE_URL, Urls.REGISTER_DEVICE_URL),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(registerDeviceRequestModel));
    if (response.statusCode == 200) {
      await prefs.setBool('isRemember', true);

      return true;
    } else {}
  }
}
