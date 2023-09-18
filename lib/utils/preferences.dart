import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EasyPrefs {
  static EasyPrefs? _instance;
  late SharedPreferences _prefs;

  EasyPrefs._();

  static EasyPrefs get instance {
    _instance ??= EasyPrefs._();
    return _instance!;
  }

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Methods for storing and retrieving data

  // Example: Save an integer value
  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  // Example: Retrieve an integer value
  int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  // Example: Save a string value
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  // Example: Retrieve a string value
  String getString(String key, {String? defaultValue}) {
    return _prefs.getString(key) ?? defaultValue ?? '';
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

// Example: Retrieve a boolean value
  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
