import 'dart:async';

import 'package:ishibashi/domain/store/repository.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/store_details/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class ListDetailViewModel extends _$ListDetailViewModel {
  StoresRepo get storesRepo => ref.read(storesRepoProvider.notifier);

  @override
  FutureOr<ListDetailState> build(String storeId) async {
    final StoreClass store = await storesRepo.getStoreById(storeId);
    final state = ListDetailState(storeClass: store);
    return state;
  }
}
