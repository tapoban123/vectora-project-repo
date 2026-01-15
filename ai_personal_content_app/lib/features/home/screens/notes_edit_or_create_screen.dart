import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/common/widgets/custom_button.dart';
import 'package:ai_personal_content_app/core/theme/app_fonts.dart';
import 'package:ai_personal_content_app/features/home/controllers/new_contents_bloc/new_contents_bloc.dart';
import 'package:ai_personal_content_app/features/home/controllers/new_contents_bloc/new_contents_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

class NotesEditOrCreateScreen extends StatefulWidget {
  final File? notesJson;

  const NotesEditOrCreateScreen({super.key, this.notesJson});

  @override
  State<NotesEditOrCreateScreen> createState() =>
      _NotesEditOrCreateScreenState();
}

class _NotesEditOrCreateScreenState extends State<NotesEditOrCreateScreen> {
  late final QuillController _controller;

  @override
  void initState() {
    _controller = QuillController.basic();
    if (widget.notesJson != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        final String json = await widget.notesJson!.readAsString();
        _controller.document = Document.fromJson(jsonDecode(json));
      });
    }
    super.initState();
  }

  Future<File> _saveNoteAsJson() async {
    final deltaString = _controller.document.toPlainText();
    final deltaJson = _controller.document.toDelta().toJson();
    final jsonString = jsonEncode(deltaJson);

    final directory = await getApplicationDocumentsDirectory();
    final file = File(
      p.join(
        directory.path,
        "${deltaString.substring(0, deltaString.length <= 15 ? deltaString.length - 1 : 15).trim()}.json",
      ),
    );

    await file.writeAsString(jsonString);
    return file;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "",
        leading: Icon(Icons.close, color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Expanded(
              child: Theme(
                data: ThemeData(
                  textSelectionTheme: TextSelectionThemeData(
                    cursorColor: Colors.white,
                  ),
                ),
                child: QuillEditor.basic(
                  controller: _controller,
                  config: QuillEditorConfig(
                    autoFocus: true,
                    placeholder: "Start typing or paste your note here...",
                    customStyles: DefaultStyles(
                      placeHolder: DefaultTextBlockStyle(
                        TextStyle(
                          fontSize: 16.sp,
                          fontVariations: [FontVariation.weight(500)],
                          color: Colors.white.withValues(alpha: 0.5),
                          fontFamily: APP_FONT_FAMILY,
                        ),
                        HorizontalSpacing.zero,
                        VerticalSpacing.zero,
                        VerticalSpacing.zero,
                        BoxDecoration(),
                      ),
                      paragraph: DefaultTextBlockStyle(
                        TextStyle(
                          fontSize: 16.sp,
                          fontFamily: APP_FONT_FAMILY,
                          fontVariations: [FontVariation.weight(500)],
                        ),
                        HorizontalSpacing.zero,
                        VerticalSpacing.zero,
                        VerticalSpacing.zero,
                        BoxDecoration(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            QuillSimpleToolbar(
              controller: _controller,
              config: const QuillSimpleToolbarConfig(
                axis: Axis.horizontal,
                multiRowsDisplay: false,
                showClearFormat: true,
                showCodeBlock: true,
                showFontFamily: false,
                showFontSize: false,
                showStrikeThrough: false,
                showUndo: false,
                showRedo: false,
                showSearchButton: false,
                showColorButton: false,
                showBackgroundColorButton: false,
                showSubscript: false,
                showSuperscript: false,
                showSmallButton: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.w),
              child: CustomAppButton(
                buttonText: "Save Note",
                minimumSize: Size(double.infinity, 48.h),
                onTap: () async {
                  final noteJson = await _saveNoteAsJson();
                  if (context.mounted) {
                    context.read<NewContentsBloc>().add(
                      CreateOrPasteNotesEvent(notesJson: noteJson),
                    );
                    context.pop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
