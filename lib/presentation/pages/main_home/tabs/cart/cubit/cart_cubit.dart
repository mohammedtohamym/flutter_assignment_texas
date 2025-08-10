import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());
}
