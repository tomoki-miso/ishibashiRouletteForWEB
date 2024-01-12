import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
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
    final List<StoreClass> storeList = await storesRepo.getStores();
    initializeDateFormatting('ja');
    final DateTime todayDate = DateTime.now();
    final String weekText = DateFormat.EEEE('ja').format(todayDate)[0];
    final List<StoreClass> storeIsBusinessDay = storeList
        .where((element) => element.daysOfWeek!.contains(weekText))
        .toList();
    final List<StoreClass> storeIsNotBusinessDay = storeList
        .where((element) => !element.daysOfWeek!.contains(weekText))
        .toList();

    final state = ListState(
      storeIsBusinessDayList: storeIsBusinessDay,
      storeIsNotBusinessDayClassList: storeIsNotBusinessDay,
    );
    return state;
  }
}
