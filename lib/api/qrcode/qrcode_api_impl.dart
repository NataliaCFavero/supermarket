import 'dart:convert';

import 'package:supermarket/api/base/base_response.dart';
import 'package:supermarket/api/qrcode/qrcode_api.dart';
import 'package:supermarket/api/qrcode/qrcode_response.dart';
import 'package:http/http.dart' as http;

class QrCodeApiImpl implements QrCodeApi {
  Future<BaseResponse> readQrdCode(String code) async {
    final response = await http.post(QrCodeApi.api_qr_code,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"url": code}));
    if (response.statusCode == 200) {
      print(response.body);
      return BaseSuccessResponse<QrCodeResponse>(
          QrCodeResponse.fromJson(jsonDecode(response.body)));
    } else {
      return BaseErrorResponse("Nao encontrada");
    }
  }
}
