import 'package:shared_preferences/shared_preferences.dart';

class CommonSharedPreference {
  static String sp_register_name = "name";
  static String sp_register_age = "age";
  static String sp_register_mobile = "mobile";
  static String sp_register_password = "password";
  static String sp_register_active_state = "active";

  static putRegister(String name, int age, int mobile, String password, bool isactive) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(sp_register_name, name);
    sp.setInt(sp_register_age, age);
    sp.setInt(sp_register_mobile, mobile);
    sp.setString(sp_register_password, password);
    sp.setBool(sp_register_active_state, isactive);
  }

  static getRegisterName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(sp_register_name);
  }

  static getRegisterAge() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(sp_register_age);
  }

  static getRegisterMobile() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(sp_register_mobile);
  }

  static getRegisterPassword() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(sp_register_password);
  }
    static getRegisterActive() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(sp_register_active_state);
  }
}