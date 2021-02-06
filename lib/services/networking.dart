import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:retry/retry.dart';
import 'dart:async';
import 'dart:io';

class NetworkHelper {
  final String url;
  http.Response response;

  NetworkHelper(this.url);

  Future getData() async {
    int timeout = 5;
    try {
      final r = RetryOptions(maxAttempts: 8);
      http.Response response = await r.retry(
          () => http.get(url).timeout(Duration(seconds: timeout)),
          retryIf: (e) => e is SocketException || e is TimeoutException);
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print(response.statusCode);
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
  }
}
