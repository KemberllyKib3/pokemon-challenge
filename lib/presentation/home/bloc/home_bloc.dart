import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/domain/usecases/home_usecases.dart';
import 'package:pokemon_challenge/presentation/home/bloc/home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecases homeUsecases;

  HomeBloc({required this.homeUsecases}) : super(HomeState.loading()) {
    on<HomeInitEvent>(_onHomeInitEvent);
    on<HomeShowMoreEvent>(_onHomeShowMoreEvent);
    on<HomeFavoriteEvent>(_onHomeFavoriteEvent);
  }

  void _onHomeInitEvent(HomeInitEvent event, Emitter<HomeState> emit) async {
    emit(HomeState.loading());
    final result = await homeUsecases.getPokemons();
    result.fold(
      (failure) => emit(HomeState.failure(failure.message)),
      (pokemons) => emit(HomeState.success(pokemons: pokemons)),
    );
  }

  void _onHomeShowMoreEvent(
      HomeShowMoreEvent event, Emitter<HomeState> emit) async {
    emit(HomeState.loading());
    final result = await homeUsecases.getPokemons(page: event.page);
    result.fold(
      (failure) => emit(HomeState.failure(failure.message)),
      (pokemons) => emit(HomeState.success(pokemons: pokemons)),
    );
  }
  
  void _onHomeFavoriteEvent(
      HomeFavoriteEvent event, Emitter<HomeState> emit) async {
    emit(HomeState.loading());
    final result = await homeUsecases.getFavorites();
    result.fold(
      (failure) => emit(HomeState.failure(failure.message)),
      (pokemons) => emit(HomeState.success(pokemons: pokemons)),
    );
  }
}
