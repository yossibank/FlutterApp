# Dart言語

# 概要

- [A Tour of the Dart Language](https://dart.dev/language)に沿って使い方の理解を深める。
- [DartPad](https://dartpad.dev)を使用することで実際にコードを書きながらできる。

## 構文基礎

### 変数(Variables)

``` javascript
var name = 'Bob'; // 変数の定義と初期化(スタイルガイドライン推奨記法)
String name = 'Bob'; // 型指定変数定義(型固定)
Object name = 'Bob'; // 型指定変数定義(型変動)
```

#### デフォルト値(Default value)

``` javascript
int? lineCount; // 初期値にnullが代入される
assert(lineCount == null); // assertでnullかどうかの確認
```

#### 遅延変数(Late variables)

* 宣言後に初期化されるnull非許容型の宣言
* 変数の遅延初期化

``` javascript
late String description;

void main() {
    description = 'HelloWorld';
    print(description);
}
```

#### Finalとconst(不変変数)

*final* → プログラムを実行して値が代入された後に変更ができない

*const* → コンパイル時に値が代入され、それ以降変更できない

※ そのためインスタンス変数を*const*にすることはできない(プログラム実行時に値が代入されるため)

```javascript
final name = 'Bob'; // 型省略記法
final String nickname = 'Bobby';

name = 'Alice'; // name' can't be used as a setter because it's final.

const bar = 1000000;
const double atm = 1.01325 * bar;
```