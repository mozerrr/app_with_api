part of 'i_search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class GetRegionEvent extends SearchEvent {
  @override
  List<Object?> get props => [];
}

class QueryEvent extends SearchEvent {
  final String query;

  const QueryEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class RequestEvent extends SearchEvent {
  final String query;

  const RequestEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class InitialEvent extends SearchEvent {
  @override
  List<Object?> get props => [];
}