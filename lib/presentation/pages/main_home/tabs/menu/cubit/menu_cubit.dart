import 'package:flutter_assignment_texas/domain/use_cases/get_resaurant_items_use_case.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuCubit extends Cubit<MenuState> {
  GetRestaurantItemsUseCase getRestaurantItemsUseCase;
  MenuCubit({required this.getRestaurantItemsUseCase})
    : super(MenuInitialState());
  void fetchRestaurantItems() async {
    emit(MenuLoadingState());
    final result = await getRestaurantItemsUseCase.call();
    result.fold(
      (error) => emit(MenuErrorState(errors: error)),
      (items) => emit(MenuSuccessState(items: items)),
    );
  }
}
