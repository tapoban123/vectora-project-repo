import 'package:ai_personal_content_app/core/common/constants.dart';
import 'package:ai_personal_content_app/features/search/models/filter_and_sort_options.dart';
import 'package:ai_personal_content_app/features/search/services/content_library_user_prefs_localdb_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterAndSortPreferencesCubit extends Cubit<FilterAndSortOptions> {
  final ContentLibraryUserPrefsLocalDbService _filterAndSortPrefsLocaldbService;

  FilterAndSortPreferencesCubit({
    required ContentLibraryUserPrefsLocalDbService
    filterAndSortPrefsLocaldbService,
  }) : _filterAndSortPrefsLocaldbService = filterAndSortPrefsLocaldbService,
       super(FilterAndSortOptions());

  void fetchUserFilterPrefs() {
    final userPrefs = _filterAndSortPrefsLocaldbService.getSavedPreferences();
    emit(userPrefs);
  }

  void _saveAndEmitPrefs(FilterAndSortOptions prefs) {
    _filterAndSortPrefsLocaldbService.setPreferences(prefs);
    emit(prefs);
  }

  void setFileType(ContentFileType type) {
    final prefs = state.copyWith(fileType: type);
    _saveAndEmitPrefs(prefs);
  }

  void setIsPinnedOnly(bool val) {
    final prefs = state.copyWith(pinnedOnly: val);
    _saveAndEmitPrefs(prefs);
  }

  void setTime(FilterTime time) {
    final prefs = state.copyWith(time: time);
    _saveAndEmitPrefs(prefs);
  }

  void setSortBy(SortOption sortOption) {
    final prefs = state.copyWith(sortOption: sortOption);
    _saveAndEmitPrefs(prefs);
  }

  void clearSort() {
    final prefs = state.copyWith(sortOption: null);
    _saveAndEmitPrefs(prefs);
  }

  void clearFilterPrefs() async {
    await _filterAndSortPrefsLocaldbService.clearFilterPrefs();
    emit(FilterAndSortOptions());
  }
}
