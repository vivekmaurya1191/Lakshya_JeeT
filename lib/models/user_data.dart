import 'package:hive/hive.dart';

class UserData {
  static final box = Hive.box('lakshyaBox');

  static String get name =>
      box.get('name', defaultValue: 'Vivek');

  static set name(String value) =>
      box.put('name', value);

  static int get streak =>
      box.get('streak', defaultValue: 11);

  static set streak(int value) =>
      box.put('streak', value);

  static int get xp =>
      box.get('xp', defaultValue: 0);

  static set xp(int value) =>
      box.put('xp', value);

  static int get level =>
      box.get('level', defaultValue: 1);

  static set level(int value) =>
      box.put('level', value);

  static double get studyHours =>
      box.get('studyHours', defaultValue: 0.0);

  static set studyHours(double value) =>
      box.put('studyHours', value);

  static double get codingHours =>
      box.get('codingHours', defaultValue: 0.0);

  static set codingHours(double value) =>
      box.put('codingHours', value);

  static String get notes =>
      box.get('notes', defaultValue: '');

  static set notes(String value) =>
      box.put('notes', value);
  static String get sleepTime =>
      box.get('sleepTime', defaultValue: '');

  static set sleepTime(String value) =>
      box.put('sleepTime', value);

  static String get wakeTime =>
      box.get('wakeTime', defaultValue: '');

  static set wakeTime(String value) =>
      box.put('wakeTime', value);

  static int get sleepScore =>
      box.get('sleepScore', defaultValue: 0);

  static set sleepScore(int value) =>
      box.put('sleepScore', value);
  static int get dailyScore =>
      box.get('dailyScore', defaultValue: 0);

  static set dailyScore(int value) =>
      box.put('dailyScore', value);
  static bool get firstSaveAchievement =>
      box.get('firstSaveAchievement',
          defaultValue: false);

  static set firstSaveAchievement(bool value) =>
      box.put('firstSaveAchievement', value);

  static bool get studyMasterAchievement =>
      box.get('studyMasterAchievement',
          defaultValue: false);

  static set studyMasterAchievement(bool value) =>
      box.put('studyMasterAchievement', value);

  static bool get xp100Achievement =>
      box.get('xp100Achievement',
          defaultValue: false);

  static set xp100Achievement(bool value) =>
      box.put('xp100Achievement', value);
  static String get lastSaveDate =>
      box.get('lastSaveDate', defaultValue: '');
  static bool get darkMode =>
      box.get('darkMode', defaultValue: false);

  static set darkMode(bool value) =>
      box.put('darkMode', value);

  static set lastSaveDate(String value) =>
      box.put('lastSaveDate', value);
  static double get studyGoal =>
      box.get('studyGoal', defaultValue: 6.0);

  static set studyGoal(double value) =>
      box.put('studyGoal', value);

  static double get codingGoal =>
      box.get('codingGoal', defaultValue: 2.0);

  static set codingGoal(double value) =>
      box.put('codingGoal', value);
}