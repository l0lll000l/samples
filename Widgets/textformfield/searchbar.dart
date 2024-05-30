
 SearchBar(
                        textStyle: MaterialStatePropertyAll(
                            TextStyle(color: Colors.white)),
                        hintText: 'Search Location',
                        hintStyle: const MaterialStatePropertyAll(
                            TextStyle(color: Colors.white)),
                        elevation: const MaterialStatePropertyAll(00.01),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        trailing: {
                          IconButton(
                              onPressed: () {
                                return print('search');
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ))
                        },
                      ),
