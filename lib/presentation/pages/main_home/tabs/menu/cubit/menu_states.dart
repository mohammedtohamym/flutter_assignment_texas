import 'package:flutter_assignment_texas/core/errors/failures.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';

class MenuState {}

class MenuInitialState extends MenuState {}

class MenuLoadingState extends MenuState {}

class MenuSuccessState extends MenuState {
  final List<RestaurantItemsResponseEntity> items;

  MenuSuccessState({required this.items});
}

class MenuErrorState extends MenuState {
  final Failures errors;

  MenuErrorState({required this.errors});
}
