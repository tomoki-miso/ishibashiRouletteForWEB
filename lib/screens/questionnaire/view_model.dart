import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page/view_model.g.dart';

@riverpod
class EditBookDetailsViewModel extends _$EditBookDetailsViewModel {
  @override
  FutureOr<EditBookDetailsState> build({String? bookId}) async {
    print(bookId);
    final state = EditBookDetailsState(
      titleController: TextEditingController(),
      descriptionController: TextEditingController(),
    );

    ref.onDispose(() {
      print('破棄されました');
      state.titleController.dispose();
      state.descriptionController.dispose();
    });

    return state;
  }
}