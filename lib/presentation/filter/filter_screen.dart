import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/injector.dart';
import 'package:pokemon_challenge/presentation/filter/bloc/filter.dart';
import 'package:pokemon_challenge/presentation/filter/components/result_screen.dart';
import 'package:pokemon_challenge/shared/helpers/helper_enums.dart';

import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';

class FilterScreen extends StatefulWidget {
  final TypeFilter typeFilter;

  const FilterScreen({
    Key? key,
    required this.typeFilter,
  }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    BlocProvider.of<FilterBloc>(context)
        .add(FilterInitEvent(typeFilter: widget.typeFilter));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsFunctions.smallAppBar(context, title: 'Filter'),
      body: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.isFailure) {
            return Center(
              child: Text(state.error!),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter by ${widget.typeFilter.name}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      alignment: WrapAlignment.start,
                      children: state.items!
                          .map(
                            (search) => InkWell(
                              onTap: () => WidgetsFunctions.push(
                                context,
                                (context) => BlocProvider<FilterBloc>(
                                  create: (context) => getIt<FilterBloc>(),
                                  child: ResultScreen(
                                    typeFilter: widget.typeFilter,
                                    search: search,
                                  ),
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: HelperEnums.color(search),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  search.toUpperCase(),
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
