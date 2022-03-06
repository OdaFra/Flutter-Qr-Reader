import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/scan_title.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTitle(
      tipo: 'geo',
    );
  }
}
