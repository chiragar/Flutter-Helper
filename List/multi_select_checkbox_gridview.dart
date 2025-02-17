import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiSelectGridView(),
    );
  }
}

class MultiSelectGridView extends StatefulWidget {
  @override
  _MultiSelectGridViewState createState() => _MultiSelectGridViewState();
}

class _MultiSelectGridViewState extends State<MultiSelectGridView> {
  List<int> selectedItems = [];
  final List<int> items = List.generate(20, (index) => index); // Example items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-select GridView'),
        actions: [
          Center(child: Text('Selected: ${selectedItems.length}')),
          SizedBox(width: 16),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedItems.contains(items[index]);
          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedItems.remove(items[index]);
                } else {
                  selectedItems.add(items[index]);
                }
              });
            },
            child: GridTile(
              child: Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.blue.withOpacity(0.5)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(items[index].toString()),
                    Positioned(
                      bottom: 4,
                      left: 4,
                      child: Checkbox(
                        value: isSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              selectedItems.add(items[index]);
                            } else {
                              selectedItems.remove(items[index]);
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
