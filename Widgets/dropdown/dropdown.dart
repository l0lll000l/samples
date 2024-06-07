
final bloodGroops = ['A+', 'A-', 'B-', 'B+', 'O+', 'O-', 'AB+', 'AB-'];
String? selectedGroop;


DropdownButtonFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.bloodtype),
                  hintText: 'Blood Group',
                  labelText: 'Blood Groop',
                  border: OutlineInputBorder()),
              items: bloodGroops.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (value) {
                selectedGroop = value as String?;      //selectedGroup has value
              },
            ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
