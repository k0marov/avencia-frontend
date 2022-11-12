import 'package:equatable/equatable.dart';

class CurrencyData extends Equatable {
  final String code;
  final String name;
  @override
  List get props => [code, name];
  const CurrencyData(this.code, this.name);
}
