                                                                                                            List
.....
                                                                                                         Create List
List<String> emptyList = [];
List<int> numbersList = [1, 2, 3, 4, 5];
List<int> numbers = List.filled(5, 0); // Creates a list of 5 zeros
List<String> lettersList = List.from("hello");  // Creates a list ['h', 'e', 'l', 'l', 'o']
List<int> squares = List.generate(10, (index) => index * index); // Creates a list of squares from 0 to 9
List<int> numbers = List.generate(10, (index) => index + 1); //creates numbers list upto 10
........................................................................................................
                                                                                                      Accessing Elements:
List<String> fruits = ['apple', 'banana', 'orange'];
String firstFruit = fruits[0]; // Access the first element (apple)
String lastFruit = fruits[fruits.length - 1]; // Accesses the last element (orange)
String firstFruit = fruits.elementAt(0); // Accesses the first element (apple)
........................................................................................................
List<String> fruits = ['apple', 'banana', 'orange'];                                                 Modifying List

fruits.add('mango'); //add: Adds an element to the end of the list:
fruits.insert(1, 'kiwi'); // Insert 'kiwi' at index 1
fruits.remove('banana');  //Removes the first occurrence of an element:
fruits.removeAt(2); // Removes the element at index 2 (orange)
........................................................................................................
var numbers = [1, 2, 3];                                                                            Adding List to list
numbers.addAll([4, 5]); // numbers will now contain [1, 2, 3, 4, 5]
........................................................................................................
var fruits = ["apple", "banana"];
var vegetables = ["carrot", "potato"];
var allProduce = [...fruits, ...vegetables]; // allProduce will contain all items
........................................................................................................
  
