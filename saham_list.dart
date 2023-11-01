import 'package:flutter/material.dart';
import 'sqlite_service.dart';
import 'models/saham.dart';

class SahamList extends StatefulWidget {
  @override
  _SahamListState createState() => _SahamListState();
}

class _SahamListState extends State<SahamList> {
  late DatabaseHandler handler;
  List<Saham> sahamData = [];

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    refreshSahamList();
  }

  void refreshSahamList() {
    handler.retrieveSaham().then((sahamList) {
      setState(() {
        sahamData = sahamList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sahamData.length,
      itemBuilder: (context, index) {
        final saham = sahamData[index];
        return ListTile(
          title: Text(saham.ticker),
          subtitle: Text(
            'Open: ${saham.open}, High: ${saham.high}, Last: ${saham.last}, Change: ${saham.change}',
            style: TextStyle(
              color: (saham.change != null && saham.change!.startsWith('-')) ? Colors.red : Colors.green,
            ),
          ),
        );
      },
    );
  }
}
