import 'package:ishibashi/domain/store/repository.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/list/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class ListViewModel extends _$ListViewModel {
  StoresRepo get storesRepo => ref.read(storesRepoProvider.notifier);

  @override
  FutureOr<ListState> build() async {
    final List<StoreClass> storeIsBusinessDayStores =
        await storesRepo.getIsBusinessDayStores();

    final List<StoreClass> storeIsNotBusinessDay =
        await storesRepo.getIsNotBusinessDayStores();

    final state = ListState(
      storeIsBusinessDayStores: storeIsBusinessDayStores,
      storeIsNotBusinessDayStores: storeIsNotBusinessDay,
    );
    return state;
  }
}
