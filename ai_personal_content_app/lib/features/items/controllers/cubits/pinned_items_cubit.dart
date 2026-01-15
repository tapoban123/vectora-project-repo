import 'package:ai_personal_content_app/features/search/entities/contents_entity.dart';
import 'package:ai_personal_content_app/features/search/services/contents_local_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinItemsCubit extends Cubit<List<ContentsEntity>> {
  final ContentsLocalStorageService _contentsLocalStorageService;

  PinItemsCubit({
    required ContentsLocalStorageService contentsLocalStorageService,
  }) : _contentsLocalStorageService = contentsLocalStorageService,
       super([]);

  List<ContentsEntity> _pinnedContents = [];

  bool checkIsContentPinned(int id) {
    return _contentsLocalStorageService.isContentPinned(id);
  }

  void pinItem(ContentsEntity content) {
    _contentsLocalStorageService.pinContent(content.id);
    _pinnedContents.insert(0, content);
    emit(List.from(_pinnedContents));
  }

  void fetchPinnedContents() {
    final contents = _contentsLocalStorageService.getPinnedContents();
    _pinnedContents = contents;
    emit(List.from(_pinnedContents));
  }

  void unPinContent(int id) {
    _contentsLocalStorageService.unPinContent(id);
    _pinnedContents.removeWhere((element) => element.id == id);
    emit(List.from(_pinnedContents));
  }

  void unPinAllContents() {
    _contentsLocalStorageService.unPinAllContents();
    _pinnedContents.clear();
    emit(List.from(_pinnedContents));
  }
}
