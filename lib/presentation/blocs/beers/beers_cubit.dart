import 'package:beer_app/core/bloc/pagination_state.dart';
import 'package:beer_app/domain/entities/beers.dart';
import 'package:beer_app/domain/use_cases/get_beers.dart';
import 'package:bloc/bloc.dart';

typedef BookingsState = PaginationState<List<Beers>, String>;

class BeersCubit extends Cubit<BookingsState> {
  BeersCubit({required this.getBeers}) : super(const PaginationState(data: []));

  final GetBeers getBeers;
  int _currentPage = 0;
  bool isBusy = false;

  Future<void> fetchBeers() async {
    _currentPage = 1;
    emit(state.copyWith(isInProgress: true, hasReachedToEnd: false));

    final result = await getBeers(BeersParams(page: _currentPage, perPage: 10));

    await result.when(
      error: (_) => emit(state.copyWith(isFailure: true)),
      success: (result) {
        if (result.isEmpty) {
          emit(state.copyWith(isSuccess: true, isEmpty: true));
        } else {
          emit(state.copyWith(isSuccess: true, data: result));
        }
      },
    );
  }

  Future<void> fetchBeersPagination() async {
    if (state.isInAgainProgress || state.hasReachedToEnd || isBusy) {
      return;
    }
    isBusy = true;

    emit(state.copyWith(isInAgainProgress: true, isSuccess: true));

    if ((state.data!.length % 10) == 0) {
      _currentPage++;
    } else {
      emit(state.copyWith(hasReachedToEnd: true, isSuccess: true));
      return;
    }

    final result = await getBeers(BeersParams(page: _currentPage, perPage: 10));

    result.when(
      error: (_) {
        emit(state.copyWith(isFailure: true));
      },
      success: (result) {
        List<Beers> last = [...state.data!];

        last.addAll(result);

        emit(state.copyWith(isSuccess: true, data: last));
      },
    ).then((value) => isBusy = false);
  }
}
