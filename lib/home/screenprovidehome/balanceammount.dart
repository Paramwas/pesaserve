import 'package:pesaserve/home/class/transaction.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'balanceammount.g.dart';

@riverpod
class Ammountbalance extends _$Ammountbalance {
  @override
  double build() {
    return 0.0;
  }

  void addammount(double num) {
    state = num;
  }
}

double makes(List<Transactionss> steal) {
  final makosa =
      steal.fold(0.00, (sum, item) => sum + double.parse(item.ammount));
  return double.parse(makosa.toStringAsFixed(2));
}
