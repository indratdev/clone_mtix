part of 'mfood_bloc.dart';

abstract class MfoodState extends Equatable {
  const MfoodState();

  @override
  List<Object> get props => [];
}

class MfoodInitial extends MfoodState {}

class FailureMfood extends MfoodState {
  String info;

  FailureMfood({
    required this.info,
  });

  @override
  List<Object> get props => [info];
}

class LoadingMfoodLocation extends MfoodState {}

class FailureMfoodLocation extends FailureMfood {
  FailureMfoodLocation({required super.info});
}

class SuccessMfoodLocation extends MfoodState {
  List<TheaterModel> theaterModel;
  String location;
  // TheaterOption theaterOption;

  SuccessMfoodLocation({
    required this.location,
    required this.theaterModel,
    // required this.theaterOption,
  });

  List<Object> get props => [location, theaterModel];
}

class SuccessSelectedTheaterLocationMfood extends MfoodState {
  String selectedLocation;
  List<TheaterModel> listData;

  SuccessSelectedTheaterLocationMfood({
    required this.selectedLocation,
    required this.listData,
  });

  List<Object> get props => [selectedLocation, listData];
}

// selected groupfood
class LoadingSelectGroupFood extends MfoodState {}

class FailureSelectGroupFood extends FailureMfood {
  FailureSelectGroupFood({required super.info});
}

class SuccessSelectGroupFood extends MfoodState {
  List<Map<int, dynamic>> listFood;
  ListGroupFood groupFood;

  SuccessSelectGroupFood({
    required this.listFood,
    required this.groupFood,
  });

  List<Object> get props => [listFood, groupFood];
}
