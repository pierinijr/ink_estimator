import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ink_estimator/core/app.dart';
import 'room_view_model.dart';

void main() {
  group('Tests View Model', () {
    InkEstimator app = const InkEstimator();
    testWidgets('Tests Room View Model', (WidgetTester tester) async {
      await tester.pumpWidget(app);
      BuildContext context = tester.element(find.byType(Container));
      RoomViewModelTest.updateRoomModelTest(context);
      RoomViewModelTest.saveDataTest(context);
      RoomViewModelTest.getQuantity(context);
    });
  });
}
