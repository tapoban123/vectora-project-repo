import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/main.dart';
import 'package:ai_personal_content_app/objectbox.g.dart';

class ContentsLocalStorageService {
  final _contentsBox = objectBoxInstance.store.box<ContentsEntity>();

  void insertContents(List<ContentsEntity> contents) {
    _contentsBox.putMany(contents);
  }

  List<ContentsEntity> fetchAllContents() {
    return _contentsBox.getAll();
  }

  List<ContentsEntity> fetchContentsByCid(List<String> cids) {
    final query = _contentsBox
        .query(ContentsEntity_.contentId.equals(cids.first))
        .order(ContentsEntity_.createdAt, flags: Order.descending)
        .build();

    final results = query.find();
    query.close();
    
    return results;
  }
}
