// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {
  HomeInitEvent();
}

class HomeShowMoreEvent extends HomeEvent {
  final int page;
  HomeShowMoreEvent(this.page);
}

class HomeFavoriteEvent extends HomeEvent {
  HomeFavoriteEvent();
}
