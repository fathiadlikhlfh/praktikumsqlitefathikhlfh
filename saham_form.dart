import 'package:flutter/material.dart';

class SahamForm extends StatefulWidget {
  final Function onSahamAdded;

  SahamForm({required this.onSahamAdded});

  @override
  _SahamFormState createState() => _SahamFormState();
}

class _SahamFormState extends State<SahamForm> {
  final TextEditingController tickerController = TextEditingController();
  final TextEditingController openController = TextEditingController();
  final TextEditingController highController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final TextEditingController changeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: tickerController,
          decoration: InputDecoration(labelText: 'Ticker'),
        ),
        TextField(
          controller: openController,
          decoration: InputDecoration(labelText: 'Open'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: highController,
          decoration: InputDecoration(labelText: 'High'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: lastController,
          decoration: InputDecoration(labelText: 'Last'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: changeController,
          decoration: InputDecoration(labelText: 'Change'),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            // Lakukan validasi input dan simpan data ke database
            // Kemudian panggil widget onSahamAdded jika data berhasil disimpan

            widget.onSahamAdded();

            // Reset form fields
            tickerController.clear();
            openController.clear();
            highController.clear();
            lastController.clear();
            changeController.clear();
          },
          child: Text('Simpan Saham'),
        ),
      ],
    );
  }
}
