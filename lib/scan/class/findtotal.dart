import 'package:pesaserve/scan/class/scanclass.dart';

double totalprice(List<Product> mercy) {
  return mercy.fold(0.0, (sum, riri) => sum + double.parse(riri.ammount));
}
