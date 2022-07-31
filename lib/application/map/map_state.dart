part of 'map_cubit.dart';

abstract class MapState extends Equatable {}

class Loading extends MapState {
  @override
  List<Object?> get props => [];
}

class Success extends MapState {
  Success();

  @override
  List<Object?> get props => [];
}

class Failed extends MapState {
  final String message;

  Failed(this.message);

  @override
  List<Object?> get props => [message];
}

class TripChoosed extends MapState {
  TripChoosed();

  @override
  List<Object?> get props => [distance];
}

class GetDistanceFialed extends MapState {
  final String message;

  GetDistanceFialed(this.message);

  @override
  List<Object?> get props => [message];
}
