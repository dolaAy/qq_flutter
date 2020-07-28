import 'dart:async';

import 'package:flutter/services.dart';
import 'package:qq_flutter/utls/http_utls.dart';

class QqFlutter {
  static const MethodChannel _channel = const MethodChannel('qq_flutter');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future getAccessToken(clientId, redirectUri,
      {scope, state, display, gut}) async {
    final String url = 'https://openmobile.qq.com/oauth2.0/m_authorize';
    var params = {
      'response_type': 'token',
      'client_id': clientId,
      'redirect_uri': redirectUri
    };
    get1(url, params: params).then((value) {
      return value;
    });
  }
}
