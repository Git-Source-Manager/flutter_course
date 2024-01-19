import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../common/Constant_Strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/task_13_drop_down/model/CityModel.dart';
import 'package:flutter_course/task_13_drop_down/model/StateModel.dart';
import 'package:flutter_course/task_13_drop_down/model/CountryModel.dart';
import 'package:flutter_course/task_13_drop_down/DropDownDetailScreen.dart';

class DropDownTask extends StatefulWidget {
  const DropDownTask({super.key});

  @override
  State<DropDownTask> createState() => _DropDownTaskState();
}

class _DropDownTaskState extends State<DropDownTask> {
  List<CountryModel> countries = [];
  List<StateModel> states = [];
  List<CityModel> cities = [];

  CountryModel? selectedCountryModel;
  StateModel? selectedStateModel;
  CityModel? selectedCityModel;

  String selectedCountryCode = "", selectedStateCode = "", selectedCityCode = "";
  String selectedCountryName = "India", selectedStateName = "Tamil Nadu", selectedCityName = "Chennai";

  @override
  void initState() {
    super.initState();
    fetchCountryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text(ConstantString.str_task_13_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ConstantString.str_task_13_country, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField<CountryModel>(
                iconEnabledColor: Colors.black,
                dropdownColor: Colors.orange[50],
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.black,),
                value: selectedCountryModel,
                onChanged: (CountryModel? newValue) {
                  setState(() {
                    selectedCountryModel = newValue!;
                    selectedCountryCode = newValue.iso2;
                    selectedCountryName = newValue.name;
                    fetchStateList(selectedCountryCode);
                  });
                },
                items: countries.map<DropdownMenuItem<CountryModel>>((CountryModel country) {
                    return DropdownMenuItem<CountryModel>(
                      value: country,
                      child: Text(country.name),
                    );
                  },
                ).toList(),
              ),
            ),


            const SizedBox(height: 35,),


            Text(ConstantString.str_task_13_state, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField<StateModel>(
                iconEnabledColor: Colors.black,
                dropdownColor: Colors.orange[50],
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.black,),
                value: selectedStateModel,
                onChanged: (StateModel? newValue) {
                  setState(() {
                    selectedStateModel = newValue!;
                    selectedStateCode = newValue.iso2;
                    selectedStateName = newValue.name;
                    fetchCityList(selectedCountryCode, selectedStateCode);
                  });
                },
                items: states.map<DropdownMenuItem<StateModel>>((StateModel state) {
                  return DropdownMenuItem<StateModel>(
                    value: state,
                    child: Text(state.name),
                  );
                },
                ).toList(),
              ),
            ),


            const SizedBox(height: 35,),


            Text(ConstantString.str_task_13_city, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField<CityModel>(
                iconEnabledColor: Colors.black,
                dropdownColor: Colors.orange[50],
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.black,),
                value: selectedCityModel,
                onChanged: (CityModel? newValue) {
                  setState(() {
                    selectedCityModel = newValue!;
                    selectedCityCode = newValue.id as String;
                    selectedCityName = newValue.name;
                  });
                },
                items: cities.map<DropdownMenuItem<CityModel>>((CityModel city) {
                  return DropdownMenuItem<CityModel>(
                    value: city,
                    child: Text(city.name),
                  );
                },
                ).toList(),
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              height: 45.0,
              child: ElevatedButton(
                onPressed: () => onSubmit(selectedCountryName, selectedStateName, selectedCityName),
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),),
                child: const Text('Submit', style: TextStyle(fontSize: 16.0, color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchCountryList() async {
    final headers = {'Content-Type': 'application/json', 'X-CSCAPI-KEY': 'Q216UU1OUHA1QXJMNlFXU3FVcVRoWVc5ZnkwVHBQOUJFZnR2STExMg==',};
    try {
      final response = await http.get(Uri.parse('https://api.countrystatecity.in/v1/countries'), headers: headers,);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<CountryModel> countryList = List<CountryModel>.from(data.map((country) => CountryModel.fromJson(country)),);
        setState(() {
          countries = countryList;
          selectedCountryModel = countries.isNotEmpty ? countries[100] : null;
          selectedCountryCode = countries[100].iso2;
          fetchStateList(selectedCountryCode);
        });
      } else {
        throw Exception('Country API Failed.');
      }
    } catch (error) {
      print('Error fetching country list: $error');
    }
  }

  Future<void> fetchStateList(String countryCode) async {
    final headers = {'Content-Type': 'application/json', 'X-CSCAPI-KEY': 'Q216UU1OUHA1QXJMNlFXU3FVcVRoWVc5ZnkwVHBQOUJFZnR2STExMg==',};
    try {
      final response = await http.get(Uri.parse('https://api.countrystatecity.in/v1/countries/'+countryCode+'/states'), headers: headers,);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<StateModel> stateList = List<StateModel>.from(data.map((state) => StateModel.fromJson(state)),);
        setState(() {
          states = stateList;
          if (countryCode == "IN") {
            selectedStateModel = states.isNotEmpty ? states[28] : null;
            selectedStateCode = states[28].iso2;
          } else {
            selectedStateModel = states.isNotEmpty ? states.first : null;
            selectedStateCode = states.first.iso2;
          }
          fetchCityList(selectedCountryCode, selectedStateCode);
        });
      } else {
        throw Exception('State API Failed.');
      }
    } catch (error) {
      print('Error fetching country list: $error');
    }
  }


  Future<void> fetchCityList(String countryCode, String stateCode) async {
    final headers = {'Content-Type': 'application/json', 'X-CSCAPI-KEY': 'Q216UU1OUHA1QXJMNlFXU3FVcVRoWVc5ZnkwVHBQOUJFZnR2STExMg==',};
    try {
      final response = await http.get(Uri.parse('https://api.countrystatecity.in/v1/countries/'+countryCode+'/states/'+stateCode+'/cities'), headers: headers,);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<CityModel> cityList = List<CityModel>.from(data.map((city) => CityModel.fromJson(city)),);
        setState(() {
          cities = cityList;
          if (countryCode == "IN" && stateCode == "TN") {
            selectedCityModel = cities.isNotEmpty ? cities[36] : null;
          } else {
            selectedCityModel = cities.isNotEmpty ? cities.first : null;
          }
        });
      } else {
        throw Exception('City API Failed.');
      }
    } catch (error) {
      print('Error fetching country list: $error');
    }
  }

  Future<void> onSubmit(String selectedCountryName, String selectedStateName, String selectedCityName) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DropDownDetailScreen(selectedCountryName, selectedStateName, selectedCityName)));
  }
}
