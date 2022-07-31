part of 'order_cubit.dart';

abstract class OrderState extends Equatable {}

class OrderInitial extends OrderState {
  final double distance;
  final int selected;

  OrderInitial(this.distance, this.selected);

  @override
  List<Object?> get props => [distance, selected];
}

class SelectedChanged extends OrderState {
  final double distance;
  final int selected;

  SelectedChanged(this.distance, this.selected);

  @override
  List<Object?> get props => [distance, selected];
}
