import 'package:shared_preferences/shared_preferences.dart';

class RecentContentsLocalDbService {
  final String _RECENT_ITEMS = "RECENT-ITEMS";
  final SharedPreferences _prefs;

  RecentContentsLocalDbService({required SharedPreferences prefs})
    : _prefs = prefs;

  void insertRecentItem(String cid) {
    final existingIds = fetchRecentItemIds();
    if (existingIds != null) {
      existingIds.insert(0, cid);
      _prefs.setStringList(_RECENT_ITEMS, existingIds.toSet().toList());
      if (existingIds.length > 4) {
        existingIds.removeLast();
      }
      return;
    }
    _prefs.setStringList(_RECENT_ITEMS, [cid]);
  }

  List<String>? fetchRecentItemIds() {
    return _prefs.getStringList(_RECENT_ITEMS);
  }

  void clear() {
    _prefs.remove(_RECENT_ITEMS);
  }
}
