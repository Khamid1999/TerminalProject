import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_choose_event.dart';
part 'language_choose_state.dart';

class LanguageChooseBloc
    extends Bloc<LanguageChooseEvent, LanguageChooseState> {
  LanguageChooseBloc() : super(LanguageChooseInitial()) {
    on<LanguageChooseEvent>(
      (event, emit) {
        // TODO: implement event handler
      },
    );
  }
}
