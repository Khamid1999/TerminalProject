import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'root_page_event.dart';
part 'root_page_state.dart';

class RootPageBloc extends Bloc<RootPageEvent, RootPageState> {
  RootPageBloc() : super(RootPageInitial(index: 0)) {
    on<RootPageIndexChangedEvent>(
      (event, emit) {
        emit(
          RootPageInitial(
            index: event.index,
          ),
        );
      },
    );
  }
}
