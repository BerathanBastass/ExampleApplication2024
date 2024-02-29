import 'package:equatable/equatable.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/mixed/model/mixed_models.dart';

abstract class MixedState extends Equatable {
  const MixedState();

  @override
  List<Object> get props => [];
}

class InitMixedState extends MixedState {}

class LoadingMixedState extends MixedState {}

class ErrorMixedState extends MixedState {
  final String message;
  ErrorMixedState(this.message);

  @override
  List<Object> get props => [message];
}

class ResponseMixedState extends MixedState {
  final List<Products> products;
  ResponseMixedState(this.products);

  @override
  List<Object> get props => [products];
}
