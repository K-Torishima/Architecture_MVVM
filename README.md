# Architecture MVVM 

## 説明
- UIKitをベースとして作ったMVVM
- 子ビューとかでSwiftUIViewを使って実装してみた。
- イベントハンドリングはClosure使って実装
- SwiftUIViewには値を渡しているだけ
- SwiftUIViewにはViewModelは持たせない、ViewModelを持つのはViewController
- ViewModelがRouterを持っている
- 画面遷移はUIKitのNavigation Controllerを使う、これによってSwiftUIのNavigation Linkを使わなくて済む。
