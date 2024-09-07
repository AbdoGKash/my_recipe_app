import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_recipe_bloc_event.dart';
part 'my_recipe_bloc_state.dart';

class MyRecipeBlocBloc extends Bloc<MyRecipeBlocEvent, MyRecipeBlocState> {
  MyRecipeBlocBloc() : super(MyRecipeBlocInitial()) {
    on<MyRecipeBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
