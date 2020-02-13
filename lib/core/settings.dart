import 'package:virus_corona_tracker/core/api.dart';
import 'package:flutter/widgets.dart';

/// [Settings] manages state according to user preferences.
/// Services listen to [Settings] triggered an update every time when
/// user preference is updated.
class Settings with ChangeNotifier {
  NewsFeedType _feedType = NewsFeedType.trending;
  NewsFeedType get feedType => _feedType;
  set feedType(NewsFeedType value) {
    if (value == _feedType) return;

    _feedType = value;
    notifyListeners();
  }

  String _countryCode = 'GLOBAL';
  String get countryCode => _countryCode;
  set countryCode(String value) {
    if (value == _countryCode) return;

    _countryCode = value;
    notifyListeners();
  }

  String _language = 'en';
  String get language => _language;
  set language(String value) {
    if (value == _language) return;

    _language = value;
    notifyListeners();
  }
}
