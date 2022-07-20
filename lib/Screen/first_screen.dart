import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as con;

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  Dio dio = Dio();
  Future<We> apicall(String city) async {
    Response res = await dio.get(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=f087892a8390ca647225a9370ac2e3bc");
    print(res.data);
    // obj = modelclass.fromJson(res.data);
    return We.fromJson(res.data);
  }

  @override
  String? city = "surat";
  TextStyle style =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);
  TextStyle namestyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white54);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Weather App",
            style: TextStyle(letterSpacing: 5),
          ),
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: Text(
                "Select a City",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      city = "goa".toString();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Goa",
                    style: style,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      city = "surat".toString();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Surat",
                    style: style,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      city = "mumbai".toString();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Mumbai",
                    style: style,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      city = "amritsar".toString();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Amritsar",
                    style: style,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      city = "london".toString();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "London",
                    style: style,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      city = "tokyo".toString();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Tokyo",
                    style: style,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      city = "new york".toString();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "New York",
                    style: style,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      city = "chennai".toString();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Chennai",
                    style: style,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      city = "kota".toString();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Kota",
                    style: style,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      city = "kolkata".toString();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Kolkata",
                    style: style,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1558369178-6556d97855d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FutureBuilder(
                future: apicall("${city}"),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    print("error");
                  } else if (snapshot.hasData) {
                    We we = snapshot.data;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${we.name}",
                                  style: style,
                                ),
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Icon(Icons.thermostat_sharp,
                                        size: 40, color: Colors.white),
                                    Text("${we.main!.temp} * C", style: style),
                                    Text(
                                      "Temperature",
                                      style: namestyle,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Icon(Icons.cloud,
                                        size: 40, color: Colors.white),
                                    Text(
                                      "${we.clouds!.all}",
                                      style: style,
                                    ),
                                    Text(
                                      "Clouds",
                                      style: namestyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Icon(Icons.arrow_circle_up_rounded,
                                        size: 40, color: Colors.white),
                                    Text(
                                      "${we.wind!.deg}",
                                      style: style,
                                    ),
                                    Text(
                                      "Wind Speed",
                                      style: namestyle,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Icon(Icons.water,
                                        size: 40, color: Colors.white),
                                    Text("${we.main!.humidity}", style: style),
                                    Text("Humidity", style: namestyle),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Icon(Icons.remove_red_eye,
                                        size: 40, color: Colors.white),
                                    Text("${we.visibility}", style: style),
                                    Text("Visibility", style: namestyle),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Icon(Icons.wb_sunny_outlined,
                                        size: 40, color: Colors.white),
                                    Text("${we.main!.humidity}", style: style),
                                    Text("Sunrise", style: namestyle),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            " WEATHER FORECAST",
                            style: TextStyle(
                                fontSize: 23,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator()
                    // Text(
                    //   "Select a City",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 45,
                    //       color: Colors.white70),
                    // ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
// Future<We> apicall(String city) async {
//   Uri uri = Uri.parse(
//       "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=f087892a8390ca647225a9370ac2e3bc");
//
//   var re = await http.get(uri);
//
//   var js = con.jsonDecode(re.body);
//   print(js);
//
//   return We.fromJson(js);
// }

class We {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  We(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  We.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coord != null) {
      data['coord'] = this.coord!.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = this.base;
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    data['visibility'] = this.visibility;
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    data['dt'] = this.dt;
    if (this.sys != null) {
      data['sys'] = this.sys!.toJson();
    }
    data['timezone'] = this.timezone;
    data['id'] = this.id;
    data['name'] = this.name;
    data['cod'] = this.cod;
    return data;
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['temp_min'] = this.tempMin;
    data['temp_max'] = this.tempMax;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['sea_level'] = this.seaLevel;
    data['grnd_level'] = this.grndLevel;
    return data;
  }
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    data['gust'] = this.gust;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    return data;
  }
}

class Sys {
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}

TextStyle style =
    TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);
