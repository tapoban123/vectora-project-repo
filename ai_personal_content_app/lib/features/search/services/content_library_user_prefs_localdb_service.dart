import 'dart:convert';

import 'package:ai_personal_content_app/features/search/models/filter_and_sort_options.dart';
import 'package:ai_personal_content_app/features/search/screens/content_library_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentLibraryUserPrefsLocalDbService {
  final String _FILTERS_KEY = "Filter-and-Sort-Prefs";
  final String _LAYOUT_KEY = "Contents-Layout";
  final SharedPreferences _prefs;

  ContentLibraryUserPrefsLocalDbService({required SharedPreferences prefs})
    : _prefs = prefs;

  Future<void> setPreferences(FilterAndSortOptions filterPrefs) async {
    await _prefs.setString(_FILTERS_KEY, jsonEncode(filterPrefs.toJson()));
  }

  FilterAndSortOptions getSavedPreferences() {
    final userPrefs = _prefs.getString(_FILTERS_KEY);
    if (userPrefs != null) {
      return FilterAndSortOptions.fromJson(jsonDecode(userPrefs));
    }
    return FilterAndSortOptions();
  }

  Future<void> clearFilterPrefs() async {
    await _prefs.remove(_FILTERS_KEY);
  }

  void setContentsLayout(ContentLayoutType layout) {
    _prefs.setString(_LAYOUT_KEY, layout.name);
  }

  ContentLayoutType getContentsLayout() {
    final layout = _prefs.getString(_LAYOUT_KEY);
    if (layout == ContentLayoutType.LIST.name) {
      return ContentLayoutType.LIST;
    }
    return ContentLayoutType.GRID;
  }
}
