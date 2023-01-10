part of 'root_page_bloc.dart';

@immutable
abstract class RootPageState {
  final int index;
  RootPageState({required this.index});
}

class RootPageInitial extends RootPageState {
  RootPageInitial({required int index}) : super(index: index);
}
