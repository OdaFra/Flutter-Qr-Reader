import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/models/scan_list_model.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTitle extends StatelessWidget {
  final String tipo;
  const ScanTitle({@required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.blueAccent,
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarScanPorId(scans[i].id);
              },
              child: ListTile(
                leading: Icon(
                  this.tipo == 'http'
                      ? Icons.home_outlined
                      : Icons.map_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scans[i].valor),
                subtitle: Text(scans[i].id.toString()),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.green,
                ),
                onTap: () => launchURL(context, scans[i]),
              ),
            ));
  }
}
