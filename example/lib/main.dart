import 'package:flutter/material.dart';
import 'package:flutter_shimmer_lite/flutter_shimmer.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'fresh_shimmer example',
      home: ExampleHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExampleHome extends StatelessWidget {
  const ExampleHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter_Shimmer_Lite  demo')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TextShimmer'),
            SizedBox(height: 8),
            SizedBox(
                height: 50,
                child: TextShimmer(text: 'Loading shimmer...', fontSize: 28)),
            Divider(),
            Text('ProfileShimmer'),
            ProfileShimmer(hasBottomLines: true),
            Divider(),
            Text('ProfilePageShimmer'),
            ProfilePageShimmer(),
            Divider(),
            Text('VideoShimmer'),
            SizedBox(height: 220, child: VideoShimmer()),
            Divider(),
            Text('ListTileShimmer'),
            ListTileShimmer(),
            Divider(),
            Text('PlayStoreShimmer'),
            SizedBox(height: 200, child: PlayStoreShimmer()),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
