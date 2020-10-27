import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/api/base/base_response.dart';
import 'package:supermarket/api/qrcode/qrcode_api.dart';
import 'package:supermarket/bloc/qrcode/shopping_events.dart';
import 'package:supermarket/bloc/qrcode/shopping_states.dart';
import 'package:supermarket/domain/shopping.dart';
import 'package:supermarket/mapper/shopping_mapper.dart';

class ShoppingBloc extends Bloc<ShoppingEvents, ShoppingStates> {
  final QrCodeApi api;

  ShoppingBloc(this.api);

  @override
  ShoppingStates get initialState => ShoppingInitState();

  @override
  Stream<ShoppingStates> mapEventToState(ShoppingEvents event) async* {
    try {
      if (event is ShoppingReadQrCodeEvent) {
        yield ShoppingReadingQrCode();
        BaseResponse response = await api.readQrdCode(
            "https://www.nfce.fazenda.sp.gov.br/NFCeConsultaPublica/Paginas/ConsultaQRCode.aspx?p=35200845543915037697650050001566911966183568|2|1|4|2E0E88102A16E977E8A0D3B42DAACFEFAA726A43");

        if (response is BaseSuccessResponse) {
          Shopping shopping = ShoppingMapper.map(response.value);
          yield ShoppingSuccessQrCode(shopping);
        } else {
          yield ShoppingErrorQrCode();
        }
      }
    } catch (e) {
      print(e);
      yield ShoppingErrorQrCode();
    }

  }
}
