part of 'root_page_bloc.dart';

@immutable
abstract class RootPageEvent {}

class RootPageIndexChangedEvent extends RootPageEvent {
  final int index;
  RootPageIndexChangedEvent({
    required this.index,
  });
}
