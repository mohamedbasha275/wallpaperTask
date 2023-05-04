import 'package:dio/dio.dart';
import 'package:wallpaper_app/core/dio/end_points.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = '*/*';
const String authorization = 'authorization';
const String defaultLanguage = 'language';
const String apiKey = 'LwpwxsnXh7bVBQMGQEK9IHnO74Q61ABsx3phkRpVItXVqNFrdgVJO7fZ';

class ApiService {
  final String _baseUrl = 'https://api.pexels.com/v1/';
  final Dio _dio;
  ApiService(this._dio);
  final Map<String, String> _headers = {
    // 'Content-Type': contentType,
    // 'Accept': applicationJson,
    'Accept': accept,
    'Authorization': apiKey,
  };

  Future<Map<String, dynamic>> get(
      {required Endpoint endpoint,String parameter=''}) async {
    var response = await _dio.get('$_baseUrl${endpoint.value}$parameter',
        options: Options(headers: _headers));
    return response.data;
  }

  // Future<Map<String, dynamic>> post(
  //     {required Endpoint endpoint,
  //     Map<String, dynamic> data = const {},
  //     bool isToken = true}) async {
  //   final String backedToken = await getIt.get<AppPreferences>().getAuthToken();
  //   final String token = 'Bearer $backedToken';
  //   _headers['Authorization'] = isToken == true ? token : '';
  //   // _headers['lang'] = defaultLanguage;
  //   var response = await _dio.post('$_baseUrl${endpoint.value}',
  //       options: Options(headers: _headers), data: data);
  //   return response.data;
  // }
  //
  // Future<Map<String, dynamic>> put(
  //     {required Endpoint endpoint,
  //     required Map<String, dynamic> data,
  //     String? token}) async {
  //   _headers['Authorization'] = token ?? '';
  //   _headers['lang'] = defaultLanguage;
  //   var response = await _dio.put('$_baseUrl${endpoint.value}',
  //       options: Options(headers: _headers), data: data);
  //   return response.data;
  // }
}
