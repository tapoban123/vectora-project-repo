import 'package:ai_personal_content_app/features/home/services/recent_contents_local_db_service.dart';
import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/features/search/services/contents_local_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentItemsCubit extends Cubit<List<ContentsEntity>> {
  final RecentContentsLocalDbService _recentContentsLocalDbService;
  final ContentsLocalStorageService _contentsLocalStorageService;

  RecentItemsCubit({
    required RecentContentsLocalDbService recentContentsLocalDbService,
    required ContentsLocalStorageService contentsLocalStorageService,
  }) : _contentsLocalStorageService = contentsLocalStorageService,
       _recentContentsLocalDbService = recentContentsLocalDbService,
       super([]);

  List<ContentsEntity> _recentItems = [];

  void setNewItem(String cid) {
    if (!_recentItems.map((e) => e.contentId,).toList().contains(cid)){
      _recentContentsLocalDbService.insertRecentItem(cid);
      _recentItems.insert(
        0,
        _contentsLocalStorageService.fetchContentsByCid([cid]).first,
      );
      if (_recentItems.length > 4) {
        _recentItems.removeLast();
      }
      emit(List.from(_recentItems));
    }
  }

  void fetchRecentItems() async {
    final cids = await _recentContentsLocalDbService.fetchRecentItemIds();
    if (cids != null) {
      _recentItems = _contentsLocalStorageService.fetchContentsByCid(cids);
      emit(List.from(_recentItems));
    }
  }

  void clearAllRecentItems()async{
    _recentContentsLocalDbService.clear();
  }
}
