import 'package:equatable/equatable.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/electronic/model/electronic_model.dart';

abstract class ElectronicState extends Equatable {
  const ElectronicState();

  @override
  List<Object> get props => [];
}

class InitElectronicState extends ElectronicState {}

class LoadingElectronicState extends ElectronicState {}

class ErrorElectronicState extends ElectronicState {
  final String message;
  ErrorElectronicState(this.message);

  @override
  List<Object> get props => [message];
}

class ResponseElectronicState extends ElectronicState {
  final List<ElectronicModel> electronicModel;
  ResponseElectronicState(this.electronicModel);

  @override
  List<Object> get props => [electronicModel];
}
