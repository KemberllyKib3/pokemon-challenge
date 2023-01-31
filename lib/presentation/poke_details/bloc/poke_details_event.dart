abstract class PokeDetailsEvent {}

class PokeDetailsInitEvent extends PokeDetailsEvent {
  final int id;
  PokeDetailsInitEvent(this.id);
}

class MarkFavoriteEvent extends PokeDetailsEvent {
  final int id;
  MarkFavoriteEvent(this.id);
}

class UnmarkFavoriteEvent extends PokeDetailsEvent {
  final int id;
  UnmarkFavoriteEvent(this.id);
}
