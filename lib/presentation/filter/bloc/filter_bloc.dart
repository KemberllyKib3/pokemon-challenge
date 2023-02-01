// ignore_for_file: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/domain/usecases/filter_usecases.dart';
import 'package:pokemon_challenge/presentation/filter/bloc/filter.dart';
import 'package:pokemon_challenge/shared/enums.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final FilterUsecases filterUsecases;

  FilterBloc({required this.filterUsecases}) : super(FilterState.loading()) {
    on<FilterInitEvent>(_onFilterInitEvent);
    on<FilterResultsEvent>(_onFilterResultsEvent);
  }

  void _onFilterInitEvent(
      FilterInitEvent event, Emitter<FilterState> emit) async {
    emit(FilterState.loading());
    final result = await filterUsecases.getFilterItems(event.typeFilter);

    result.fold(
      (failure) => emit(FilterState.failure(failure.message)),
      (items) => emit(FilterState.filter(items: items)),
    );
  }

  void _onFilterResultsEvent(
      FilterResultsEvent event, Emitter<FilterState> emit) async {
    emit(FilterState.loading());
    dynamic result;

    switch (event.typeFilter) {
      case TypeFilter.type:
        result = await filterUsecases.getPokemonsByType(event.search!);
        break;
      case TypeFilter.habitat:
        result = await filterUsecases.getPokemonsByHabitat(event.search!);
        break;
      default:
        result = await filterUsecases.getPokemonsByName(event.search!);
        break;
    }
    result.fold(
      (failure) => emit(FilterState.failure(failure.message)),
      (result) => emit(FilterState.success(
          pokemons: (result is List) ? result.cast() : [result])),
    );
  }
}
