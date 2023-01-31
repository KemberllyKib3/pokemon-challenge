import 'package:pokemon_challenge/shared/shared.dart';

abstract class FilterEvent {}

class FilterInitEvent extends FilterEvent {
  final TypeFilter typeFilter;

  FilterInitEvent({required this.typeFilter});
}

class FilterResultsEvent extends FilterEvent {
  final TypeFilter typeFilter;
  final String? search;

  FilterResultsEvent({required this.typeFilter, this.search});
}
