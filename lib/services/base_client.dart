import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pak_festive/controller/common_controller.dart';
import '../utils/constants.dart';
import '../utils/helper.dart';

class BaseClient {
  final String tag = "BaseClient";
  final CommonController controller = Get.find<CommonController>();

  Future<bool> checkInternet() async {
    try {
      var response = await http
          .get(Uri.parse("https://google.com"), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      }).timeout(const Duration(seconds: timeOutDuration));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException {
      return false;
    } on TimeoutException {
      return false;
    }
  }

  noInternet() async {
    var res = await checkInternet();
    closeLoadingDialog();
    if (res) {
      showAlert(
          dialogType: DialogType.error,
          title: "unableToConnectToServer".tr,
          description:
              "${"unableToConnectToServerDesc".tr} ${Constants.supportEmail}");
    } else {
      showAlert(
          dialogType: DialogType.error,
          title: "noInternet".tr,
          description: "");
    }
  }

  connectionTimeOut() {
    closeLoadingDialog();
    showAlert(
        dialogType: DialogType.error,
        title: "timeOutError".tr,
        description: "checkInternetConnection".tr);
  }

  unAuthenticatedError(http.Response response, [bool isFromLogin = false]) {
    if (isFromLogin) {
      processRes(response: response, title: "loginFailed".tr);
    } else {
      AwesomeDialog(
        context: Get.context as BuildContext,
        dialogType: DialogType.error,
        width: 400,
        onDismissCallback: (dismissType) {},
        autoDismiss: false,
        animType: AnimType.bottomSlide,
        title: "unAuthenticatedErrorOccurred".tr,
        desc: "tokenExpired".tr,
        btnOkText: "loginAgain".tr,
        btnOkOnPress: () {
          controller.logOutUser();
        },
      ).show();
    }
  }

  static const int timeOutDuration = 20;

  // GET
  Future<dynamic> get(String url) async {
    var uri = Uri.parse(url);
    log("Url: $url");
    log("Request Type: GET");
    try {
      var response = await http.get(uri, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      }).timeout(const Duration(seconds: timeOutDuration));
      log("Response StatusCode: ${response.statusCode}");
      log("Response Body: ${response.body}");
      return _processResponse(response, url, "");
    } on SocketException {
      noInternet();
    } on TimeoutException {
      connectionTimeOut();
    }
  }

  // POST
  Future<dynamic> post(String url, dynamic jsonBody) async {
    var uri = Uri.parse(url);
    try {
      log("Url: $url");
      log("Request Type: POST");
      log("Request Body: $jsonBody");
      var response = await http.post(
        uri,
        body: jsonBody,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: timeOutDuration));
      log("Response StatusCode: ${response.statusCode}");
      log("Response Body: ${response.body}");
      return _processResponse(response, url, jsonBody);
    } on SocketException {
      noInternet();
    } on TimeoutException {
      connectionTimeOut();
    }
  }

  // GET with Auth
  Future<dynamic> getWithAuth(
    String url,
  ) async {
    var uri = Uri.parse(url);
    try {
      log("Url: ${uri.toString()}");
      log("Request Type: GET with auth");
      var response = await http.get(uri, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Bearer ${controller.user.token.toString()}",
      }).timeout(const Duration(seconds: timeOutDuration));
      log("Response StatusCode: ${response.statusCode}");
      log("Response Body: ${response.body}");
      return _processResponse(response, url, "");
    } on SocketException {
      noInternet();
    } on TimeoutException {
      connectionTimeOut();
    }
  }

  // POST with Auth
  Future<dynamic> postWithAuth(String url, dynamic jsonBody) async {
    var uri = Uri.parse(url);
    try {
      log("Url: ${uri.toString()}");
      log("Request Type: POST");
      log("Request Body: $jsonBody");
      var response = await http.post(
        uri,
        body: jsonBody,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Bearer ${controller.user.token.toString()}",
        },
      ).timeout(const Duration(seconds: timeOutDuration));
      log("Response StatusCode: ${response.statusCode}");
      log("Response Body: ${response.body}");
      return _processResponse(response, url, jsonBody.toString());
    } on SocketException {
      noInternet();
    } on TimeoutException {
      connectionTimeOut();
    }
  }

  Future<dynamic> putWithAuth(String url, dynamic jsonBody) async {
    var uri = Uri.parse(url);
    try {
      log("Url: ${uri.toString()}");
      log("Request Type: PUT");
      log("Request Body: $jsonBody");
      var response = await http.put(
        uri,
        body: jsonBody,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Bearer ${controller.user.token.toString()}",
        },
      ).timeout(const Duration(seconds: timeOutDuration));
      log("Response StatusCode: ${response.statusCode}");
      log("Response Body: ${response.body}");
      return _processResponse(response, url, jsonEncode(jsonBody));
    } on SocketException {
      noInternet();
    } on TimeoutException {
      connectionTimeOut();
    }
  }

  dynamic _processResponse(http.Response response, String url, String params) {
    log("Inside _processResponse ${response.body}");
    switch (response.statusCode) {
      case 200:
        log("Inside status 200");
        return processRes(response: response);
      case 201:
        log("Inside status 201");
        return processRes(response: response);
      case 400:
        log("Inside status 400");
        processRes(response: response, title: "badRequestErrorOccurred".tr);
        return null;
      case 401:
        log("Inside status 401");
        // Un Authorized
        unAuthenticatedError(response, url.contains("login") ? true : false);
        return null;
      case 403:
        log("Inside status 403");
        // Access Denied
        processRes(response: response, title: "accessDeniedErrorOccurred".tr);
        return null;
      case 405:
        log("Inside status 405");
        // Method Not Allowed
        closeLoadingDialog();
        showAlert(
            dialogType: DialogType.error,
            title: "methodNotAllowedError".tr,
            description: "");
        return null;
      case 422:
        log("Inside status 422");
        // Un-Processable Entity
        processRes(response: response, title: "badRequestErrorOccurred".tr);
        return null;
      case 500:
        log("Inside status 500");
        // Server Error
        processRes(response: response, title: "serverError".tr);
        return null;
      default:
        log("Inside status default");
        // Unknown Error
        processRes(response: response, title: "unknownErrorOccurred".tr);
        return null;
    }
  }

  void parseErrorOccurred(String error) {
    showAlert(
        dialogType: DialogType.error,
        title: "dataParsingError".tr,
        description: error);
  }

  processRes({String? title, required http.Response response}) {
    log("Inside processRes");
    try {
      var data = jsonDecode(response.body);
      log("CheckingResponse Status ${data['status']}::Data ${data['data']}");

      if (data['status'].runtimeType == bool) {
        if (!data['status']) {
          var description = data['error'];
          // var description = "Something went wrong on server side";
          closeLoadingDialog();
          showAlert(
              dialogType: DialogType.error,
              title: title ?? "errorOccurred".tr,
              description: description ?? "unknownErrorOccurred".tr);
          return null;
        } else {
          closeLoadingDialog();
          return data;
        }
      }
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
      }
      parseErrorOccurred(e.toString());
    }
    closeLoadingDialog();
    return null;
  }
}
