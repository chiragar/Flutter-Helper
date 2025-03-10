// Text Selectable:
SelectableText(
  'This text is selectable. Long-press and drag to select it.',
  style: TextStyle(fontSize: 20.0),
),

//------------------------------------------------------

// Full Scaffold Selected
SelectionArea(
  child: Scaffold(
    appBar: AppBar(
      title: Text('Selectable Text App'),
    ),
    body: Center(
      child: Text('This text is selectable. Long-press and drag to select it.'),
    ),
  ),
),

//------------------------------------------------------

// Rich Text Selectable
SelectableText.rich(
  TextSpan(
    text: 'This is a selectable rich text. ',
    style: TextStyle(fontSize: 20.0),
    children: [
      TextSpan(
        text: 'You can select individual spans of text.',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  ),
),

//------------------------------------------------------

// SelectableText with Copy Action
import 'package:flutter/material.dart';

class SelectableTextWithCopyAction extends StatefulWidget {
  @override
  _SelectableTextWithCopyActionState createState() => _SelectableTextWithCopyActionState();
}

class _SelectableTextWithCopyActionState extends State<SelectableTextWithCopyAction> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable Text with Copy Action'),
      ),
      body: Center(
        child: SelectableText(
          'This text is selectable. Long-press and drag to select it.',
          style: TextStyle(fontSize: 20.0),
          onTap: () async {
            final selectedText = _controller.selection.textInside(_controller.text);
            final copyAction = PopupMenuItem<String>(
              value: 'copy',
              child: Row(
                children: <Widget>[
                  Icon(Icons.content_copy),
                  SizedBox(width: 8.0),
                  Text('Copy'),
                ],
              ),
            );
            final selectedAction = await showMenu<String>(
              context: context,
              position: RelativeRect.fill,
              items: <PopupMenuEntry<String>>[copyAction],
            );
            if (selectedAction == 'copy') {
              Clipboard.setData(ClipboardData(text: selectedText));
            }
          },
        ),
      ),
    );
  }
}
