

//------------------------------------------------------------- set materialApp to GetMaterialApp

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

//--------------------------------------------------------create class and function 
class Tapcontroller extends GetxController {
  int _x = 0;
  int get x => _x;
  void increaseX() {
    _x++;
    update();
    print(_x);
  }
}
// ---------------------------------------------------------- dependency injection
 Tapcontroller controller = Get.put(Tapcontroller());
//------------------------------------------------------------ access
  onTap: () {
                controller.increaseX();
           },

//------------------------------------------------------------show value value
  GetBuilder<Tapcontroller>(
              builder: (_) {
                return Text(controller.x.toString());
              },
            ),


//---------------------------------------------------------------- Access  the value from another page
   Tapcontroller controller = Get.find();       // dependancy injection

  GetBuilder<Tapcontroller>(
                builder: (controller) {
                  return Text(
                    controller.x.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  );
                },
              )
//---------------------------------------------------------------- directly access, no dependancy injection
Text(
        Get.find<Tapcontroller>().x.toString(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
//---------------------------------------------------------------- use obx to change value

class Tapcontroller extends GetxController {
  RxInt _y = 0.obs;
  RxInt get y => _y;

  void increaseY() {
    _y.value++;
  }
  void decreaseY() {
    _y.value--;
  }
}
 Obx(() {
            return Text(Get.find<Tapcontroller>().y.value.toString());
          }
***************************************************************************************************
//--------------------------------------------------------------page route
 onTap: () { Get.to(() {  return FirstPage();  });},           // going to a page
//---------------------------------------------------------------back button
onPressed: () {
              Get.back();
            },

*****************************************************************************************************
