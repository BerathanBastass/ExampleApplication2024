import 'package:equatable/equatable.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/female/model/female_model.dart';

abstract class FemaleState extends Equatable {
  const FemaleState();

  @override
  List<Object> get props => [];
}

class InitFemaleState extends FemaleState {}

class LoadingFemaleState extends FemaleState {}

class ErrorFemaleState extends FemaleState {
  final String message;
  ErrorFemaleState(this.message);

  @override
  List<Object> get props => [message];
}

class ResponseFemaleState extends FemaleState {
  final List<FemaleModel> femaleModel;
  ResponseFemaleState(this.femaleModel);

  @override
  List<Object> get props => [femaleModel];
}
