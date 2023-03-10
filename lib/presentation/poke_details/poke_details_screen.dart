import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon_challenge/presentation/poke_details/bloc/poke_details.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/poke_details_body.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';

class PokeDetailsScreen extends StatefulWidget {
  final int id;

  const PokeDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<PokeDetailsScreen> createState() => _PokeDetailsScreenState();
}

class _PokeDetailsScreenState extends State<PokeDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<PokeDetailsBloc>(context)
        .add(PokeDetailsInitEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokeDetailsBloc, PokeDetailsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Scaffold(body: WidgetsFunctions.showLoading(context));
        }

        if (state.isFailure) {
          WidgetsFunctions.showSnackError(context, message: state.error!);
        }

        return PokeDetailsBody(pokemon: state.pokemon!);
      },
    );
  }
}
