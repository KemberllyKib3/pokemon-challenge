import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/injector.dart';
import 'package:pokemon_challenge/presentation/filter/bloc/filter.dart';
import 'package:pokemon_challenge/presentation/filter/components/custom_filter_button.dart';
import 'package:pokemon_challenge/presentation/filter/components/result_screen.dart';

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
  final controller = ScrollController();

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
            return WidgetsFunctions.showLoading(context);
          }

          if (state.isFailure) {
            WidgetsFunctions.showSnackError(context, message: state.error!);
          }

          return SingleChildScrollView(
            controller: controller,
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
                  GridView.count(
                    controller: controller,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.5,
                    children: state.items!
                        .map(
                          (text) => CustomFilterButton(
                            text: text,
                            onTap: () => WidgetsFunctions.push(
                              context,
                              (context) => BlocProvider<FilterBloc>(
                                create: (context) => getIt<FilterBloc>(),
                                child: ResultScreen(
                                  typeFilter: widget.typeFilter,
                                  search: text,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
