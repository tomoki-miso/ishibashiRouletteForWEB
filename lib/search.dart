import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> selectedTags = [];
  List<String> selectedDays = [];

  final tags = [
    '居酒屋',
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

  final TextEditingController _nameController = TextEditingController();

  Future<void> _search() async {
    final String name = _nameController.text;

    // Firestoreから店舗データを取得
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('stores').get();
    List<QueryDocumentSnapshot> allStores = querySnapshot.docs;

    // アプリ内で選択された時間帯に基づいてフィルタリング
    List<QueryDocumentSnapshot> filteredStores = [];

    for (QueryDocumentSnapshot store in allStores) {
      String openTime = store['openTime'];
      String closeTime = store['closeTime'];

      // 選択した時間（dateTime）を文字列に変換
      String selectedTimeString =
          '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';

      // 選択した時間が開店時間と閉店時間の間にあるかどうかをチェック
      if (selectedTimeString.compareTo(openTime) >= 0 && selectedTimeString.compareTo(closeTime) < 0) {
        filteredStores.add(store);
      }
    }

    // 検索結果を表示するページに遷移
    Navigator.push(
      context,
      MaterialPageRoute(
       builder: (context) => ResultPage(filteredStores, selectedDays as List<String>, selectedTags),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.greenAccent),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
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
                          controller: _nameController,
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
                            padding: EdgeInsets.all(8),
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
                                          setState(() {
                                            if (isSelected) {
                                              selectedTags.remove(tag);
                                            } else {
                                              selectedTags.add(tag);
                                            }
                                            print('選択中のジャンル: $selectedTags');
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 3),
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(16)),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.pink,
                                            ),
                                            color: isSelected ? Colors.pink : null,
                                          ),
                                          child: Text(
                                            tag,
                                            style: TextStyle(
                                              color: isSelected ? Colors.white : Colors.pink,
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
                                        mainAxisAlignment: MainAxisAlignment.center,
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
                                              selectedTags = List.of(tags); // deep copy を使ってコピーする
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
                          width: _screenSize.width * 0.85,
                          height: _screenSize.height * 0.1,
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
                                  final isSelected = selectedDays.contains(day);
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          selectedDays.remove(day);
                                        } else {
                                          selectedDays.add(day);
                                        }
                                        print('選択中の曜日: $selectedDays');
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.pink,
                                        ),
                                        color: isSelected ? Colors.pink : null,
                                      ),
                                      child: Text(
                                        day,
                                        style: TextStyle(
                                          color: isSelected ? Colors.white : Colors.pink,
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
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 3),
                              ),
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
                        ElevatedButton(
                          onPressed: _search,
                          child: const Text(
                            '検索',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
