import 'dart:async';

import 'package:app_with_api/core/bloc/search/i_search_bloc.dart';
import 'package:app_with_api/data/network/network.dart';
import 'package:app_with_api/domain/entity/country.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> implements ISearchBloc {
  late List<Country> _allCountries;

  static final _queryEvents = StreamController<QueryEvent>();

  late final Stream<QueryEvent> _filteredQueryEvents;
  late final StreamSubscription _requestEvents;

  SearchBloc() : super(SearchLoadingState()) {
    add(GetRegionEvent());
    _filteredQueryEvents =
        _queryEvents.stream.debounceTime(const Duration(milliseconds: 1500));
    _requestEvents = _filteredQueryEvents.listen((event) {
      add(RequestEvent(query: event.query));
    });
  }

  @override
  Future<void> close() {
    final Curve curve = Curves.easeOut;
    _requestEvents.cancel();
    return super.close();
  }

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is QueryEvent) {
      if (event.query.isEmpty) yield SearchInitial(countries: _allCountries);
      if (event.query.length < 3) return;
      yield SearchLoadingState();
      _queryEvents.add(event);
      return;
    }
    if (event is GetRegionEvent) {
      try {
        yield SearchLoadingState();
        final response = await Network.getEuropeCountries();
        _allCountries = response.map((e) => Country.fromJson(e)).toList();
        yield SearchInitial(countries: _allCountries);
      } catch (e) {
        print(e);
        yield SearchErrorState(lastEvent: event);
      }
    }
    if (event is RequestEvent) {
      try {
        // do action
        //event.query
        yield SearchResultState(
            countries: _allCountries
                .where((element) => element.name
                    .toLowerCase()
                    .contains(event.query.toLowerCase()))
                .toList());
      } catch (e) {
        yield SearchErrorState(lastEvent: event);
      }
      return;
    }
    if (event is InitialEvent) {
      yield SearchInitial(countries: _allCountries);
      return;
    }
  }
}
