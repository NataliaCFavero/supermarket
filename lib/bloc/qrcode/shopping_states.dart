import 'package:equatable/equatable.dart';
import 'package:supermarket/domain/shopping.dart';

class ShoppingStates extends Equatable {
  @override
  List<Object> get props => null;
}

class ShoppingInitState extends ShoppingStates {}

class ShoppingReadingQrCode extends ShoppingStates {

}

class ShoppingSuccessQrCode extends ShoppingStates {
  final Shopping shopping;

  ShoppingSuccessQrCode(this.shopping);

  @override
  List<Object> get props => [shopping];
}

class ShoppingErrorQrCode extends ShoppingStates {}
