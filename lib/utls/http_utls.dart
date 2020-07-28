import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';

// Dio请求方法封装
Future post(url, {formData, headers}) async {
  try {
    Response response;
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse('application/x-www-form-urlencoded');
    dio.options.contentType = Headers.formUrlEncodedContentType;
    if (headers != null) {
      dio.options.headers = headers;
    }
    // 发起POST请求，传入url及表单参数
    response = await dio.post(url,
        data: formData,
        options: Options(contentType: Headers.formUrlEncodedContentType));
    // 成功返回
    if (response.statusCode == 200) {
      return jsonDecode(response.toString());
    } else {
      throw Exception('后端接口异常，请检查测试代码和服务器运行情况...');
    }
  } catch (e) {
    return print('error:::${e}');
  }
}

Future put(url, {formData, headers}) async {
  try {
    Response response;
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse('application/x-www-form-urlencoded');
    dio.options.contentType = Headers.formUrlEncodedContentType;
    if (headers != null) {
      dio.options.headers = headers;
    }
    // 发起POST请求，传入url及表单参数
    response = await dio.put(url,
        data: formData,
        options: Options(contentType: Headers.formUrlEncodedContentType));
    // 成功返回
    if (response.statusCode == 200) {
      return jsonDecode(response.toString());
    } else {
      throw Exception('后端接口异常，请检查测试代码和服务器运行情况...');
    }
  } catch (e) {
    return print('error:::${e}');
  }
}

Future get1(url, {params}) async {
  try {
    Response response;
    Dio dio = Dio();
    response = await dio.get(url, queryParameters: params);
    print(response);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('后端接口异常，请检查测试代码和服务器运行情况...');
    }
  } catch (e) {
    return print('Error:::${e}');
  }
}
