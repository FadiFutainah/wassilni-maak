part of 'home_cubit.dart';

abstract class HomeDataState extends Equatable {}

class Loading extends HomeDataState {
  @override
  List<Object?> get props => [];
}

class Success extends HomeDataState {
  final List<VehicleModel> vehicles;
  final String instructions;
  final ContactModel contacts;

  Success(
    this.vehicles,
    this.instructions,
    this.contacts,
  );

  @override
  List<Object?> get props => [vehicles, instructions, contacts];
}

class Failed extends HomeDataState {
  final String message;

  Failed(this.message);

  @override
  List<Object?> get props => [message];
}
