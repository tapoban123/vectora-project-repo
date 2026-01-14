import 'package:shared_preferences/shared_preferences.dart';

class RecentContentsLocalDbService {
  final String _RECENT_ITEMS = "RECENT-ITEMS";

  Future<SharedPreferences> _init() async {
    return await SharedPreferences.getInstance();
  }

  void insertRecentItem(String cid) async {
    final prefs = await _init();
    final existingIds = await fetchRecentItemIds();
    if (existingIds != null) {
      existingIds.insert(0, cid);
      prefs.setStringList(_RECENT_ITEMS, existingIds.toSet().toList());
      if (existingIds.length > 4) {
        existingIds.removeLast();
      }
      return;
    }
    prefs.setStringList(_RECENT_ITEMS, [cid]);
  }

  Future<List<String>?> fetchRecentItemIds() async {
    final prefs = await _init();
    return prefs.getStringList(_RECENT_ITEMS);
  }

  void clear() async {
    final prefs = await _init();
    prefs.remove(_RECENT_ITEMS);
  }
}
