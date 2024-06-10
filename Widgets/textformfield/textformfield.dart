TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Name',
          hintText: 'Enter your Name',
          prefixIcon: Icon(Icons.person),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your Name';
          }
          return null;
        },
      ),
/////////////////////////////////////////////////////////////////////

             
         TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Location',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'location',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.cloud,
                      color: Colors.white,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Search Location';
                    }
                    return null;
                  },
                ),
//////////////////////////////////////////////////////////////////////////
  Widget textfield(
      String labelText, String HintText, String returnText, var icon) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        hintText: HintText,
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return returnText;
        }
        return null;
      },
    );
  }
//////////////////////////////////////////////////////////////////////////////
 TextFormField(
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val!)
                                  ? null
                                  : "Please enter a valid email";A
                            },
                            controller: emailController,
                            onChanged: (value) {
                              email = emailController.text;
                            },
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: kOrange)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: kOrange)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.blue)),
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                              prefixIcon: Icon(
                                Icons.email,
                                color: kOrange,
                              ),
                            ),
                          ),
