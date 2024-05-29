import 'package:gsheets/gsheets.dart';

class GSheetsHelper {
  final GSheets _gsheets;
  final String _spreadsheetId;

  GSheetsHelper(String credentials, this._spreadsheetId)
      : _gsheets = GSheets(credentials);

  Future<List<Map<String, String>>?> fetchSheetData(String sheetTitle) async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    final sheet = ss.worksheetByTitle(sheetTitle);
    if (sheet == null) {
      return [];
    }
    return await sheet.values.map.allRows();
  }
}
