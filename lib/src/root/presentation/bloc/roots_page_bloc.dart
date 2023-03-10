import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'roots_page_event.dart';
part 'roots_page_state.dart';

class RootsPageBloc extends Bloc<RootsPageEvent, RootsPageState> {
  RootsPageBloc() : super(RootsPageInitial()) {
    on<RootsPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
