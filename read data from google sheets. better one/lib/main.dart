import 'package:flutter/material.dart';
import 'package:flutter_application_3/1.dart';
import 'package:gsheets/gsheets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sheets API Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoogleSheetList(),
    );
  }
}

class GoogleSheetList extends StatefulWidget {
  @override
  _GoogleSheetListState createState() => _GoogleSheetListState();
}

class _GoogleSheetListState extends State<GoogleSheetList> {
  final String _credentials = r'''
  
  ''';
  final String _spreadsheetId = 'paste spreadsheetId here';
  final String _sheetTitle = 'Sheet1';
  late GSheetsHelper _gsheetsHelper;
  //************************************************************************************************************************************************** */

//************************************************************************************************************************************************** */
  List<Map<String, dynamic>> _sheetData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _gsheetsHelper = GSheetsHelper(
        _credentials, _spreadsheetId); //-------------------set up gsheethelper
    _fetchData();
  }

  Future<void> _fetchData() async {
    final data = await _gsheetsHelper
        .fetchSheetData(_sheetTitle); //--------------------fetching data
    setState(() {
      _sheetData = data!;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sheets Data'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _sheetData.length,
              itemBuilder: (context, index) {
                final row = _sheetData[index];
                return ListTile(
                  title: Text(row['name'] ?? 'No Name'),
                  subtitle: Text(row['email'] ?? 'No Email'),
                  trailing: Text(row['isBeginer']!),
                );
              },
            ),
    );
  }
}
