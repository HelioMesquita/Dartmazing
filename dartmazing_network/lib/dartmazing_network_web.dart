import 'dart:async';
// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'http_verbs.dart';
import 'native_response.dart';
import 'request_abstract.dart';

/// A web implementation of the DartmazingNetwork plugin.
class DartmazingNetworkWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'dartmazing_network',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = DartmazingNetworkWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    throw PlatformException(
      code: 'Unimplemented',
      details:
          'dartmazing_network for web doesn\'t implement \'${call.method}\'',
    );
  }

  Future<NativeResponse<T>> execute<T>({
    required RequestAbstract request,
    required T factory(
      Map<String, dynamic> json,
    ),
  }) async {
    try {
      var client = http.Client();
      Uri _uri;
      if (request.scheme == "https") {
        _uri = Uri.https(request.host, request.path, request.queryParameters);
      } else {
        _uri = Uri.http(request.host, request.path, request.queryParameters);
      }

      Response response;

      switch (request.httpVerb) {
        case HttpVerbs.GET:
          response = await client.get(_uri);
          break;

        case HttpVerbs.POST:
          response = await client.post(_uri,
              headers: request.headers, body: request.bodyParameters);
          break;

        case HttpVerbs.PUT:
          response = await client.put(_uri,
              headers: request.headers, body: request.bodyParameters);
          break;

        case HttpVerbs.PATCH:
          response = await client.patch(_uri,
              headers: request.headers, body: request.bodyParameters);
          break;
        case HttpVerbs.DELETE:
          response = await client.delete(_uri,
              headers: request.headers, body: request.bodyParameters);
          break;
      }

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      return NativeResponse<T>.fromHttp(
          jsonResponse, response.statusCode.toString(), factory);
    } on PlatformException catch (e) {
      return Future.error(e);
    }
  }
}
