import 'package:app_with_api/domain/entity/country.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

abstract class ISearchBloc implements Bloc<SearchEvent, SearchState> {}
