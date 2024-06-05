Map
                                                       Creating a map
  var map1 = {
  'a': 1,
  'b': 2,
  'c': 3
};
print(map1); // {'a': 1, 'b': 2, 'c': 3}
...........................................
var original = {'a': 1, 'b': 2};
var map3 = Map.of(original);
print(map3); // {'a': 1, 'b': 2}
...........................................
var original = {'a': 1, 'b': 2};
var map4 = Map.from(original);
print(map4); // {'a': 1, 'b': 2}
...........................................
  var iterable = ['a', 'b', 'c'];
var map5 = Map.fromIterable(iterable, key: (item) => item, value: (item) => item.codeUnitAt(0));
print(map5); // {'a': 97, 'b': 98, 'c': 99}
...........................................
  var keys = ['a', 'b', 'c'];
var values = [1, 2, 3];
var map6 = Map.fromIterables(keys, values);
print(map6); // {'a': 1, 'b': 2, 'c': 3}
...........................................                  Common map operation
var map = <String, int>{};                                   Adding Entries:
map['d'] = 4;
map['e'] = 5;
print(map); // {'d': 4, 'e': 5}
...........................................
var map = {'a': 1, 'b': 2, 'c': 3};                         Removing Entries:
map.remove('b');
print(map); // {'a': 1, 'c': 3}
...........................................
var map = {'a': 1, 'b': 2};                                 Checking for Keys/Values:
print(map.containsKey('a')); // true
print(map.containsValue(2)); // true
...........................................
var map = {'a': 1, 'b': 2};                                 Updating Entries:
map['a'] = 10;
print(map); // {'a': 10, 'b': 2}
...........................................
  var map = {'a': 1, 'b': 2, 'c': 3};                       Iterating Over Entries:
map.forEach((key, value) {
  print('Key: $key, Value: $value');
});

...........................................
  var map = {'a': 1, 'b': 2, 'c': 3};                        Transforming Map
var newMap = map.map((key, value) => MapEntry(key, value * 10));
print(newMap); // {'a': 10, 'b': 20, 'c': 30}

...........................................
















  
.....................................................................
                                 addAll: Adds all key-value pairs from another map to the current map.
var map1 = {'a': 1, 'b': 2};
var map2 = {'c': 3, 'd': 4};
map1.addAll(map2);
print(map1); // {'a': 1, 'b': 2, 'c': 3, 'd': 4}
......................................................................
                                 clear: Removes all key-value pairs from the map.
var map = {'a': 1, 'b': 2};
map.clear();
print(map); // {}
......................................................................
                                 containsKey: Checks if the map contains the specified key.
var map = {'a': 1, 'b': 2};
print(map.containsKey('a')); // true
......................................................................
                                 containsValue: Checks if the map contains the specified value.
var map = {'a': 1, 'b': 2};
print(map.containsValue(2)); // true
.......................................................................
                                 forEach: Applies a function to each key-value pair
var map = {'a': 1, 'b': 2};
map.forEach((key, value) {
  print('Key: $key, Value: $value');
});
.......................................................................
                                 remove: Removes a key-value pair by key and returns the value.
var map = {'a': 1, 'b': 2};
var value = map.remove('a');
print(value); // 1
print(map); // {'b': 2}

.......................................................................
                                 putIfAbsent: Adds a key-value pair if the key is not already present.
var map = {'a': 1, 'b': 2};
map.putIfAbsent('c', () => 3);
print(map); // {'a': 1, 'b': 2, 'c': 3}

.......................................................................
                                 update: Updates the value for the specified key.
var map = {'a': 1, 'b': 2};
map.update('a', (value) => value + 1);
print(map); // {'a': 2, 'b': 2}

.......................................................................
                                 updateAll: Updates all values in the map.
var map = {'a': 1, 'b': 2};
map.updateAll((key, value) => value * 2);
print(map); // {'a': 2, 'b': 4}
.......................................................................
                                 length: Returns the number of key-value pairs in the map.
var map = {'a': 1, 'b': 2};
print(map.length); // 2
.......................................................................
                                 isEmpty: Checks if the map is empty.
var map = {};
print(map.isEmpty); // true
.......................................................................
                                 isNotEmpty: Checks if the map is not empty.
var map = {'a': 1};
print(map.isNotEmpty); // true
.......................................................................
                                 keys: Returns an iterable of the keys in the map.
var map = {'a': 1, 'b': 2};
print(map.keys); // (a, b)
.......................................................................
                                 values: Returns an iterable of the values in the map.
var map = {'a': 1, 'b': 2};
print(map.values); // (1, 2)
.......................................................................
                                map: Transforms each key-value pair into a new map.
var map = {'a': 1, 'b': 2};
var newMap = map.map((key, value) => MapEntry(key, value * 2));
print(newMap); // {'a': 2, 'b': 4}
.......................................................................
 
