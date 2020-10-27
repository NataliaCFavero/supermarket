import 'package:supermarket/api/base/base_response.dart';
import 'package:supermarket/api/qrcode/qrcode_response.dart';

abstract class QrCodeApi {

  static const String api_qr_code = 'https://supermarket-java.herokuapp.com/qrCode/nf/1';

  Future<BaseResponse> readQrdCode(String code);
}
