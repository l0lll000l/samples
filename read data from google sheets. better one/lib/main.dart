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
  {
     "type": "service_account",
  "project_id": "abiding-result-424616-e1",
  "private_key_id": "9d336149b8502d1fae7904a58881f9d76d2ccdd6",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC0ufYM7aZBusHY\nUt3DPpg6ulEthhOco+K5w5sfETf/o7WGcwgTKZJLZkOKhgzgpnDmPlJEBmbc0CmK\n0+v5KVBr6LFBFi9nP6b/EB2ENVm+aXC/WgIvrMfoAuOVrwXNM/uz37NaZwXMkY5V\n+pZOGqNtviLRi5BTozjNis29Fj1yMKk9suIXxnOioA+jvuEICKnTF/ficwODiLEP\nOMg20TK4x04AvfP/c3bngAfE4PAF02WuXsF29LfdotG+RLMEYsh+pQU8ayqjv/Tq\nrYOYzLOgrmA4IxcVImWYXC915b4vriqeGM6JthdtPBlIlvqHUy8zTc+zCF/85o4Q\nkhDEggWbAgMBAAECggEAUbF33Cs2yqJ5imgW73FljbJ4DHx9dAKO88rMXXRCnG+r\nmA16enMBusyMvlrPCmOiSCmmtTIxoCIGjUczdUssG8MxEMtO/TyEJ+rodMFLAmwW\nN6EfuN5A9QsNRjW6CSK05f+6SqSkNe8b6JigBck709ktUwxj3rK69AqI6q7Zcrpx\nJLHZDbJXZQRjCiaontQj/tClQ1+joBvOuelD0WYN6IcpkF+0Cggf5f7QDHQxDgHB\nKT5pb50mNAli9fz/eiqhy1xXPj+mUkgMIMZb2yUe6qFk8C8os3gBiYOCl+nXp/Xe\nUtJ9Pnlekv1GohiieSfEAzsQeMdZ/gHoe9dUDixYzQKBgQD2FcBDudHIjls4fie5\nwAd8K+uOUXLPB8XRv8GIcMQuMOcHYeIQzTOrC0sRX50VEUqKGgM3YR9P/w7SjljQ\nQh22+JpSW9FPQRzVX/iemtY7EW1WIbS0i2Z/1aTSX7NLhhs2YlW1jMiHIXfTAOfb\nSJII9ldri9nSpaEP53QAVsrkVQKBgQC8AhFbzRqDTtNYymHOoNZA0xaeKsKBNqWp\nQYbz+2Mj+N4KjrkTcshQtqhi9fBccAt6EIfqjwjAMmd3m4aT1seJwLdk0WSU4Cfz\n0luSD0ATCGWBhEkN/Q/Eeku5ZnAvvFfZGywc4Z2U9ZLJtsXDHZqIjFNG49X7qwjK\na28UP4OyLwKBgQDOpqdleFcV/43VHAPKNdtTSCKwye8KsnFJ2ajxJhlo3MI17doE\n1/2KpposhcmI1pNs87k9uT6tU/gjk0w73znK3Gvju51C2+AVw1kp/8blpZXWncl9\nUA8MTOHzlFAhnQWfHubw5b/D0rQoKnuKJyATjKMO+ks6XMKrc2dznW8WXQKBgQCi\nMT58bfMDeItHvECom4R6pCCNDuKByn0cCVW9QhADRn13qizsJEe/qfSWewmDFX4x\nLfWzWvX3qQQt4VQ2UkIOCt2r8iDNdpvA8qbg2Js0UDgRhefoU3q4y7BsH32FEPzQ\nZWqm99SUX07lCfKOIwnf5v8o1wERfjm1Nv27ABhDLQKBgCEHONHBU5DsSNP//yep\nRM6ZgaP4hXXl8UFzWJGk+NlAZ7mV85BxnTum0fqKvdHSVRA3685mrKPY2FsByD69\nJcKK+lPmTdF3Lzu6Vk/rsEwOxbvNJ0lqYnOmnUPW5wN3MXF9uYZgWveak/k/WpBT\nJ8fI795adZ9OJofow+3Qezq2\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@abiding-result-424616-e1.iam.gserviceaccount.com",
  "client_id": "114218535238313753336",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40abiding-result-424616-e1.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"

  }
  ''';
  final String _spreadsheetId = '14DFLWJAkt4BlHzXoBzjns0FJpnwxbMmmUpfG2lq87c8';
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
