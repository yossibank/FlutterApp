# Dart言語

# 概要

- [A Tour of the Dart Language](https://dart.dev/language)で基礎文法を学べる。
- [DartPad](https://dartpad.dev)を使用することで実際にコードを書きながら学べる。

## 基礎文法

### 変数

``` dart
var name = 'Bob'; // 変数の定義と初期化(スタイルガイドライン推奨記法)
String name = 'Bob'; // 型指定変数定義(型固定)
Object name = 'Bob'; // 型指定変数定義(型変動)
```

### finalとconst

*final* → プログラムを実行して値が代入された後に変更ができない

*const* → コンパイル時に値が代入され、それ以降変更できない

※ そのためインスタンス変数を*const*にすることはできない(プログラム実行時に値が代入されるため)

``` dart
final name = 'Bob'; // 型省略記法
final String nickname = 'Bobby';

name = 'Alice'; // name' can't be used as a setter because it's final.

const bar = 1000000;
const double atm = 1.01325 * bar;
```

### 関数

#### オプション引数

``` dart
/// 引数がなくても呼び出せる(デフォルトの値が使われる)
void func1(String params1, [int param2 = 0]) {
    print('$param1,$param2');
}

func1('Dart') // Dart,0
```

#### 名前付き引数

``` dart
/// 名前を指定して呼び出せる
void func2({String? param1, int? param2}) {
    print('$param1,$param2');
}

func2(param1: 'Dart', param2: 10) // Dart,10
```

#### 必須引数

``` dart
void func3({required String param1, required int param2}) {
    print('$param1,$param2');
}

func3(param1: 'Dart', param2: 100) // Dart,100
```

#### アロー関数

``` dart
void func4(String? param1, int? param2) => print('$param1,$param2');

func4('Dart', 1000) // Dart,1000
```

## オブジェクト志向

### クラス

* クラス定義(class)
* コンストラクタ(class名と同名のメソッド)
  * インスタンス生成時に呼ばれる
* インスタンスの生成: new
* 継承: extends
  * 親クラスを1つのみ指定し利用できる
* 抽象クラス: abstract
  * 継承での利用を前提とした、インスタンス化できないクラスを作成する
* Mixin: with
  * 継承をせずに、他クラスのフィールドやメソッドが使える

### フィールド/メソッド

* プライベートフィールド/メソッド
  * `_`で始めるとスコープがプライベートになる
* staticフィールド/メソッド: static
  * クラスに属するフィールド/メソッドになる
* getter/setter: get/set
  * getter/setterでフィールドにアクセスする

``` dart
class Dart {
  int _data = 0; // プライベート
  int get data => _data; // getter
  set data(int data) => _data = data; // setter
}

Dart dart = Dart();
dart.data = 20;
print(dart.data); // 20
```