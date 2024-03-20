import 'package:vertical_weight_slider/src/models/measurement_unit.dart';

extension MeasurementUnitExtension on MeasurementUnit {
  int get largePointerIndex {
    switch (this) {
      case MeasurementUnit.kg:
        return 10;
      default:
        return 12;
    }
  }

  int get mediumPointerIndex {
    switch (this) {
      case MeasurementUnit.kg:
        return 5;
      default:
        return 6;
    }
  }
}
