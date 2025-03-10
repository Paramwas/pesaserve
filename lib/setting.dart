import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'setting.g.dart';

@riverpod
class darkmode extends _$darkmode {
  @override
  bool build() {
    return true;
  }

  void toogle() {
    state = !state;
  }
}
