import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



/// WebViewアプリの状態を持つStatefulWidget
class FormPage extends StatefulWidget {
  /// WebViewAppのコンストラクタ
  const FormPage({super.key});

  /// 状態オブジェクトを作成
  @override
  State<FormPage> createState() => _FormPageState();
}

/// WebViewAppの状態を管理するStateクラス
class _FormPageState extends State<FormPage> {
  /// WebViewControllerオブジェクト
  late final WebViewController webViewController;

  /// 初期状態を設定
  @override
  Future<void> initState() async {
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
