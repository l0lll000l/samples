
  TimeOfDay selectedTime = TimeOfDay.now();



Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5))))),
                    onPressed: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                          initialEntryMode: TimePickerEntryMode.dial);
                      if (timeOfDay != null) {
                        setState(() {
                          selectedTime = timeOfDay;
                        });
                      }
                    },
                    child: Text(
                        'Select Time  ${selectedTime.hour}:${selectedTime.minute}')),
              )
