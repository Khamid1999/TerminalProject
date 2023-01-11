part of 'root_page_cubit.dart';

class RootPageState extends Equatable {
  final int index;
  final NavBarItem navBarItem;
  final List<Widget> screenList = [
    const HistoryPage(),
    const HomePage(),
    const StatisticsPage(),
  ];

  RootPageState({
    required this.index,
    required this.navBarItem,
  });

  @override
  List<Object> get props => [index, navBarItem];
}
