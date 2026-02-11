import 'dart:convert';

import 'package:ai_personal_content_app/core/common/models/user_credits_and_quotas_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreditsAndQuotasLocalStorage {
  final SharedPreferences _sharedPreferences;
  final String _key = "CREDITS-AND-QUOTAS";

  CreditsAndQuotasLocalStorage({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  void saveCreditsAndQuotasData(UserCreditsAndQuotasModel data) async{
    await _sharedPreferences.setString(_key, jsonEncode(data.toJson()));
  }

  UserCreditsAndQuotasModel? getCreditsAndQuotasData() {
    final res = _sharedPreferences.getString(_key);
    if (res != null) {
      return UserCreditsAndQuotasModel.fromJson(jsonDecode(res));
    }
    return null;
  }
}
