import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/firebase/firebase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@Riverpod(keepAlive: true)
class StoresRepo extends _$StoresRepo {
  FirebaseFirestore get db => ref.read(firestoreProvider);
  CollectionReference<StoreClass> get collection => ref
      .read(firestoreProvider)
      .collection(StoreClass.collectionName)
      .withConverter<StoreClass>(
        fromFirestore: (snapshot, _) => StoreClass.fromJson(snapshot.data()!),
        toFirestore: (data, _) => data.toJson(),
      );

  @override
  void build() {}

  Future<List<StoreClass>> getStores() async {
    final List<StoreClass> storesList = [
      ...await collection
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList()),
    ];
    return storesList;
  }

  Future<List<StoreClass>> getIsBusinessDayStores([
    List<StoreClass>? stores,
  ]) async {
    final String weekText = await _getWeekText();

    if (stores == null || stores.isEmpty) {
      stores = await getStores();
    }

    final List<StoreClass> isBusinessDaysStores = stores
        .where((element) => element.daysOfWeek!.contains(weekText))
        .toList();

    return isBusinessDaysStores;
  }

  Future<List<StoreClass>> getIsNotBusinessDayStores([
    List<StoreClass>? stores,
  ]) async {
    final String weekText = await _getWeekText();

    if (stores == null || stores.isEmpty) {
      stores = await getStores();
    }
    final List<StoreClass> isNotBusinessDaysStores = stores
        .where((element) => !element.daysOfWeek!.contains(weekText))
        .toList();

    return isNotBusinessDaysStores;
  }

  Future<StoreClass> getStoreById(String storeId) async =>
      collection.doc(storeId).get().then((value) {
        if (value.data() == null) {
          throw ArgumentError('データが存在しません');
        }
        return value.data()!;
      });

  Future<List<StoreClass>> searchStoresByKeyWord(
    List<String> searchWordList,
  ) async {
    final List<StoreClass> storeList = [
      ...await collection
          .where('keywords', arrayContainsAny: searchWordList)
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList()),
    ];
    return storeList;
  }

  Future<List<StoreClass>> searchStoresByDays(
    List<String> selectedDays,
  ) async {
    final List<StoreClass> searchedStoresByDays = [
      ...await collection
          .where('daysOfWeek', arrayContainsAny: selectedDays)
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList()),
    ];

    return searchedStoresByDays;
  }

  Future<String> _getWeekText() async {
    await initializeDateFormatting('ja');
    final DateTime todayDate = DateTime.now();
    final String weekText = DateFormat.EEEE('ja').format(todayDate)[0];

    return weekText;
  }
}
