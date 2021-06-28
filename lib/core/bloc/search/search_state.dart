part of 'i_search_bloc.dart';

abstract class SearchState extends Equatable {
  final List<Country> countries;

  const SearchState({required this.countries});

  @override
  List<Object> get props => [countries];
}

class SearchInitial extends SearchState {
  const SearchInitial({required List<Country> countries})
      : super(countries: countries);

  @override
  List<Object> get props => [countries];
}

class EmptySearchState extends SearchState {
  const EmptySearchState() : super(countries: const []);

  @override
  List<Object> get props => [];
}

class SearchLoadingState extends EmptySearchState {
  @override
  List<Object> get props => [];
}

class SearchErrorState extends EmptySearchState {
  final SearchEvent lastEvent;

  const SearchErrorState({required this.lastEvent});

  @override
  List<Object> get props => [lastEvent];
}

class SearchResultState extends SearchState {
  const SearchResultState({required List<Country> countries})
      : super(countries: countries);

  @override
  List<Object> get props => [countries];
}
