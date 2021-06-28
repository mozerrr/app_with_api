import 'package:app_with_api/core/bloc/search/i_search_bloc.dart';
import 'package:app_with_api/data/bloc/search/search_bloc.dart';
import 'package:app_with_api/generated/l10n.dart';
import 'package:app_with_api/presentation/widgets/country_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RegionSearchScreen extends StatelessWidget {
  const RegionSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ISearchBloc>(
      create: (_) => SearchBloc(),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(S.current.region_search_title),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      onChanged: (value) {
                        context
                            .read<ISearchBloc>()
                            .add(QueryEvent(query: value));
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<ISearchBloc, SearchState>(
                      builder: (context, state) {
                        if (state is SearchLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is SearchErrorState) {
                          return Center(
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<ISearchBloc>()
                                    .add(state.lastEvent);
                              },
                              child: Text('try again'),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: state.countries.length,
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (context, index) {
                            if (state.countries.isEmpty) {
                              return Center(child: Text('isEmpty('));
                            }
                            return CountryListTile(
                              country: state.countries[index],
                            );
                          },
                        );
                      },
                    ),
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
