import 'package:flutter/material.dart';
import 'package:flutter_application_5/data/image_path.dart';
import 'package:flutter_application_5/model/weather_response_model.dart';
import 'package:flutter_application_5/screen/temp_widget.dart';
import 'package:flutter_application_5/screen/widgets.dart';
import 'package:flutter_application_5/secrets/weather_service.dart';
import 'package:flutter_application_5/services/location_provider.dart';
import 'package:flutter_application_5/utilities/apptext.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController searchcontroller = TextEditingController();

class _HomePageState extends State<HomePage> {
  //----------------------------------------------------------------------------start-------

  @override
  void initState() {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);

    // locationProvider.DeterminePosition().then((_) {
    //   if (locationProvider.currentLocationName != null) {
    //     // var city = locationProvider.currentLocationName!.locality;
    //     var city = 'kerala';
    //     if (city != null) {
    //       Provider.of<WeatherserviceProvider>(context, listen: false)
    //           .fetchWetherDataByCity(city);
    //     }
    //   }
    // });
    Provider.of<WeatherserviceProvider>(context, listen: false)
        .fetchWetherDataByCity('kerala');

    super.initState();
  }

//--------------------------------------------------------------------------------end------
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final locationProvider = Provider.of<LocationProvider>(context);
    final weatherProvider = Provider.of<WeatherserviceProvider>(context);

    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true, //----------imp
          body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          background1[
                                  weatherProvider.weather?.weather![0].main ??
                                      "N/A"] ??
                              "assets/img/drizzle.jpg",
                        ))),
                height: size.height,
                width: size.width,
                child: Consumer<WeatherserviceProvider>(
                  builder: (context, value, child) {
                    var locationcity;
                    if (value.weather != null) {
                      locationcity = value.weather!.name;
                    } else {
                      locationcity = 'unknown location';
                    }
//------------------------------------------------------------search bar
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SearchBar(
                          controller: searchcontroller,
                          textStyle: const MaterialStatePropertyAll(
                              TextStyle(color: Colors.white)),
                          hintText: 'Search Location',
                          hintStyle: const MaterialStatePropertyAll(
                              TextStyle(color: Colors.white)),
                          elevation: const MaterialStatePropertyAll(00.01),
                          backgroundColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          trailing: {
                            IconButton(
                                onPressed: () {
                                  Provider.of<WeatherserviceProvider>(context,
                                          listen: false)
                                      .fetchWetherDataByCity(
                                          searchcontroller.text);
                                },
                                icon: const Icon(Icons.search,
                                    color: Colors.white))
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Align(
                          alignment: const Alignment(0, -0.9),
                          child: ListTile(
                              subtitle: AppText(
                                  data: 'Good Morning', color: Colors.white),
                              leading: const Icon(Icons.location_pin,
                                  color: Colors.red),
                              title: AppText(
                                  data: locationcity,
                                  color: Colors.white,
                                  fw: FontWeight.w700,
                                  size: 18)),
                        ),
                      ),
                      Align(
                          alignment: const Alignment(0, -1),

                          //background image
                          child: Image(
                              image: AssetImage(imagePath1[weatherProvider
                                          .weather?.weather![0].main ??
                                      "N/A"] ??
                                  "assets/img/clear.png"))),
                      Container(
                        width: 300,
                        child: Column(
                          children: [
                            Consumer<WeatherserviceProvider>(
                              builder: (context, value, child) {
                                var maintemp;
                                if (value.weather != null) {
                                  maintemp =
                                      ' ${value.weather!.main!.temp}\u00B0 C';
                                } else {
                                  maintemp = '22';
                                }
                                return AppText(
                                    data: maintemp,
                                    size: 26,
                                    fw: FontWeight.bold,
                                    color: Colors.white);
                              },
                            ),
                            Consumer<WeatherserviceProvider>(
                              builder: (context, value, child) {
                                var maintemp;
                                if (value.weather != null) {
                                  maintemp = value.weather!.name;
                                } else {
                                  maintemp = 'dubai';
                                }
                                return AppText(
                                    data: maintemp,
                                    size: 26,
                                    fw: FontWeight.bold,
                                    color: Colors.white);
                              },
                            ),
                            Consumer<WeatherserviceProvider>(
                              builder: (context, value, child) {
                                var description;
                                // value.weather!.main!.temp;
                                if (value.weather != null) {
                                  description =
                                      value.weather!.weather![0].description;
                                } else {
                                  description = '21';
                                }
                                return AppText(
                                    data: description,
                                    size: 22,
                                    color: Colors.white);
                              },
                            ),
                            AppText(
                                data: DateFormat('MMMM d  hh:mm aaa')
                                    .format(DateTime.now()),
                                size: 20,
                                color: Colors.white)
                          ],
                        ),
                      ),

                      // Temp widget
                      Container(
                          alignment: Alignment.center,
                          height: 150,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: Colors.black.withOpacity(0.4)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Consumer<WeatherserviceProvider>(
                                        builder: (context, value, child) {
                                          var temp;

                                          if (value.weather != null) {
                                            temp =
                                                ' ${value.weather!.main!.tempMax}\u00B0 C';
                                          } else {
                                            temp = '21';
                                          }
                                          return TempWidget(
                                            temp: temp,
                                          );
                                        },
                                      ),
                                      SizedBox(width: 20),
                                      Consumer<WeatherserviceProvider>(
                                        builder: (context, value, child) {
                                          var tempmin;

                                          if (value.weather != null) {
                                            tempmin =
                                                ' ${value.weather!.main!.tempMin}\u00B0 C';
                                          } else {
                                            tempmin = '22';
                                          }
                                          return TempWidget(
                                            image:
                                                'assets/img/temperature-low.png',
                                            title: 'Temp Min',
                                            temp: '$tempmin ',
                                          );
                                        },
                                      ),
                                    ]),
                                kdivider,
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Consumer<WeatherserviceProvider>(
                                        builder: (context, value, child) {
                                          var sunrise;

                                          if (value.weather != null) {
                                            sunrise =
                                                value.weather!.sys!.sunrise;
                                            sunrise = DateFormat.Hm().format(
                                                DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        sunrise * 1000));
                                          } else {
                                            sunrise = '5am';
                                          }
                                          return TempWidget(
                                              image: 'assets/img/sun.png',
                                              title: 'Sun Rise  ',
                                              temp: sunrise);
                                        },
                                      ),
                                      SizedBox(width: 20),
                                      Consumer<WeatherserviceProvider>(
                                        builder: (context, value, child) {
                                          var sunset;

                                          if (value.weather != null) {
                                            sunset = value.weather!.sys!.sunset;
                                            sunset = DateFormat.Hm().format(
                                                DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        sunset));
                                          } else {
                                            sunset = '5am';
                                          }
                                          return TempWidget(
                                              image: 'assets/img/moon.png',
                                              title: 'Sun Set',
                                              temp: sunset);
                                        },
                                      ),
                                    ])
                              ]))
                    ]);
                  },
                )
                //
                ),
          )),
    );
  }
}
//
