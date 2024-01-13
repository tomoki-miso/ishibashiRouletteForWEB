import 'package:ishibashi/domain/store/repository.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/search/business_day_search/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class BusinessDaySearchViewModel extends _$BusinessDaySearchViewModel {
  StoresRepo get storesRepo => ref.read(storesRepoProvider.notifier);

  @override
  FutureOr<BusinessDaySearchState> build() async {
    const state = BusinessDaySearchState(
      searchResultIsBusinessDayStores: [],
      searchResultIsNotBusinessDayStores: [],
      selectedDays: [],
    );
    return state;
  }

  Future<void> searchBusinessDay(List<String> selectedDays) async {
    if (selectedDays.isNotEmpty) {
      final List<StoreClass> searchedStores =
          await storesRepo.searchStoresByDays(selectedDays);
      final List<StoreClass> searchedIsBusinessDayStores =
          await storesRepo.getIsBusinessDayStores(searchedStores);
      final List<StoreClass> searchedIsNotBusinessDayStores =
          await storesRepo.getIsNotBusinessDayStores(searchedStores);

      final data = state.requireValue;
      state = AsyncData(
        data.copyWith(
          searchResultIsBusinessDayStores: searchedIsBusinessDayStores,
          searchResultIsNotBusinessDayStores: searchedIsNotBusinessDayStores,
        ),
      );
    } else {
      final data = state.requireValue;
      state = AsyncData(
        data.copyWith(
          searchResultIsBusinessDayStores: [],
          searchResultIsNotBusinessDayStores: [],
        ),
      );
    }
  }

  /// 曜日のボタンを押したときの処理
  Future<void> handleDaySelection(String day) async {
    final data = state.requireValue;
    final List<String> updatedDays = List.from(data.selectedDays); // 新しいリストを作成

    if (updatedDays.contains(day)) {
      updatedDays.remove(day); // 要素を削除
    } else {
      updatedDays.add(day); // 要素を追加
    }

    state = AsyncData(data.copyWith(selectedDays: updatedDays));
    await searchBusinessDay(updatedDays);
  }
}
