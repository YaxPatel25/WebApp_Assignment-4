import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//this code for weather widget

void main() => runApp(
  MaterialApp(
    title: "Weather Screen",
    home: Weather(),
  )
);

class Weather extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Weather>{

  //Decalring variable to store the data which comes as API response
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  //this function will fetch the data from openweathermap API
  Future getWeather () async{
    http.Response response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Toronto&units=imperial&appid=e6bbd35040c8e514014fa0f467ca8aa6"));
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState(){
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(

            //Code to make a container on upper side of screen
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Currently in Toronto",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                ),

                //Code to show temperature that comes from in API response
                Text(
                  temp != null ? temp.toString() + "\u00B0" : "Loading",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : "Loading",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
          ),

          //To show more info about weather
          Expanded(
              child:Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[

                    //Code to show temperature
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                      title: Text("Temperature"),
                      trailing: Text(temp != null ? temp.toString() + "\u00B0" : "Loading"),
                    ),

                    //Code to show weather
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.cloud),
                      title: Text("Weather"),
                      trailing: Text(description != null ? description.toString() : "Loading"),
                    ),

                    //Code to show Humidity
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.sun),
                      title: Text("Humidity"),
                      trailing: Text(humidity != null ? humidity.toString() : "Loading"),
                    ),

                    //Code to show Wind speed
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.wind),
                      title: Text("Wind Speed"),
                      trailing: Text(windSpeed != null ? windSpeed.toString() : "Loading"),
                    )
                  ],
                ),
              ),
          )
        ],
      ),
    );
  }
}

