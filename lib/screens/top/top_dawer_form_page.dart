import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



/// WebViewアプリの状態を持つStatefulWidget
class TopDrawerFormPage extends StatefulWidget {
  /// WebViewAppのコンストラクタ
  const TopDrawerFormPage({super.key});

  /// 状態オブジェクトを作成
  @override
  State<TopDrawerFormPage> createState() => _TopDrawerFormPageState();
}



/// WebViewAppの状態を管理するStateクラス
class _TopDrawerFormPageState extends State<TopDrawerFormPage> {
  /// WebViewControllerオブジェクト
  late final WebViewController webViewController;

  /// 初期状態を設定
  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..loadRequest(
        Uri.parse('https://forms.gle/iiimfxKHgszmbTTx7'),
      );
  }
  


  /// アプリのUIを構築
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.greenAccent),
         backgroundColor: Colors.white,
         shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),),
          ),
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
}
