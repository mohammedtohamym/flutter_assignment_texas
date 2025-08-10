abstract class MainHomeState {
  const MainHomeState();
}

class MainHomeTabState extends MainHomeState {
  final int currentIndex;

  const MainHomeTabState({this.currentIndex = 0});

  MainHomeTabState copyWith({int? currentIndex}) {
    return MainHomeTabState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
