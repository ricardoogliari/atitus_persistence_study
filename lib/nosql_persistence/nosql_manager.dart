import 'package:shared_preferences/shared_preferences.dart';

const String LOGIN_KEY = "login";

void login() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(LOGIN_KEY, true);
}

void logoff() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(LOGIN_KEY, false);
}

Future<bool> loggedStatus() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(LOGIN_KEY) ?? false;
}
