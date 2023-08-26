import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> selectedTags = [];
  final tags = [
    '飲み屋',
    'カフェ',
    'イタリアン',
    '和食',
    '中華',
    '韓国料理',
    '定食屋',
    'スイーツ',
    'コスパ',
    'ラーメン',
    '焼き鳥',
  ];

  final daysOfWeek = [
    '月',
    '火',
    '水',
    '木',
    '金',
    '土',
    '日',
  ];

  TimeOfDay dateTime = TimeOfDay.now();

  void _timePicker(BuildContext context) {
    DatePicker.showPicker(
      context,
      pickerModel: TimePickerModel(
        currentTime: DateTime.now(),
        locale: LocaleType.jp,
        showSecondsColumn: false,
      ),
      onConfirm: (pickedTime) {
        setState(() {
          dateTime = TimeOfDay.fromDateTime(pickedTime);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: AppBar(
          iconTheme: IconThemeData(
          color: Colors.greenAccent
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            Container(
              width: _screenSize.width * 0.9,
              margin: EdgeInsets.only(top: 20, bottom: 50),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: _screenSize.width * 0.89,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 13.0),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Enter search keyword...',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onChanged: (value) {
                          // Handle search keyword changes here
                        },
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ジャンル",
                      ),
                      Container(
                        width: _screenSize.width * 0.85,
                        height: _screenSize.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          padding: EdgeInsets.all(8), // タグのパディングを小さく調整
                          child: Column(
                            children: [
                              Wrap(
                                runSpacing: 8,
                                spacing: 8,
                                children: tags.map((tag) {
                                  final isSelected = selectedTags.contains(tag);
                                  return InkWell(
                                    child: GestureDetector(
                                      onTap: () {
                                        //デバック文　できれば消したいね
                                        print('タップされました: $tag');
                                        if (isSelected) {
                                          print('選択解除: $tag');
                                          selectedTags.remove(tag);
                                        } else {
                                          print('選択: $tag');
                                          selectedTags.add(tag);
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 3),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16)),
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.pink,
                                          ),
                                          color:
                                              isSelected ? Colors.pink : null,
                                        ),
                                        child: Text(
                                          tag,
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.pink,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            selectedTags.clear();
                                            setState(() {});
                                          },
                                          child: const Text('クリア'),
                                        ),
                                        const SizedBox(width: 16),
                                        ElevatedButton(
                                          onPressed: () {
                                            selectedTags = List.of(
                                                tags); // deep copy を使ってコピーする
                                            setState(() {});
                                          },
                                          child: const Text('ぜんぶ'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text("営業日"),
                      Container(
                        //営業曜日
                        width: _screenSize.width * 0.85,
                        height: _screenSize.height * 0.1, // 高さ
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(3),
                            child: Wrap(
                              runSpacing: 8,
                              spacing: 8,
                              children: daysOfWeek.map((day) {
                                final isSelected = selectedTags.contains(day);
                                return InkWell(
                                  onTap: () {
                                    if (isSelected) {
                                      selectedTags.remove(day);
                                    } else {
                                      selectedTags.add(day);
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.pink,
                                      ),
                                      color: isSelected ? Colors.pink : null,
                                    ),
                                    child: Text(
                                      day,
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.pink,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Text("営業時間"),
                      Container(
                        width: _screenSize.width * 0.85,
                        height: 100, // 高さ
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 3)), //できればpadding以外で調節したい　野村

                            Text(
                              "${dateTime.hour}時${dateTime.minute}分",
                              style: TextStyle(fontSize: 25),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _timePicker(context);
                              },
                              child: const Text(
                                '時間を選択',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
