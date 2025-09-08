import 'package:flutter/material.dart';
import 'package:flutter_shimmer_lite/flutter_shimmer.dart';
import 'package:flutter_shimmer_lite_example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ExampleApp renders shimmer widgets',
      (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MaterialApp(home: ExampleApp()));

    // Wait for shimmer animations to settle
    await tester.pumpAndSettle();

    // Verify presence of key shimmer widgets
    expect(find.byType(TextShimmer), findsOneWidget);
    expect(find.byType(ProfileShimmer), findsOneWidget);
    expect(find.byType(ProfilePageShimmer), findsOneWidget);
    expect(find.byType(VideoShimmer), findsOneWidget);
    expect(find.byType(ListTileShimmer), findsOneWidget);
    expect(find.byType(PlayStoreShimmer), findsOneWidget);

    // Optional: verify text
    expect(find.text('TextShimmer'), findsOneWidget);
    expect(find.text('ProfileShimmer'), findsOneWidget);
    expect(find.text('VideoShimmer'), findsOneWidget);
  });
}
