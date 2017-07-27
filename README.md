# WeatherDBVisualization

ウェブコンテンツ課題2つ目のプログラムです。  
Reflowを利用したアイコン整列において、アイコンが6×6で並んでいる状態（ウィンドウサイズ670×670）を完全に記憶しているものとした、他のサイズにおけるアイコン選択時間のヒートマップを示す。	

## 動作環境

- Processing v3.3
- [import de.bezier.data.sql.\*;]と[import controlP5.\*;]を使えるようにする必要があります。（スケッチ→ライブラリをインポート→ライブラリを追加、から探してください。）

## 操作方法

ボタンをクリックすると、そのウィンドウサイズにおけるアイコン選択時間ヒートマップを見ることができます。  
上の空欄に数字を入れると、選択時間（ミリ秒）の最低値・最高値を指定することができます。  
例えば、MINを1000として、次のウィンドウサイズボタンを選択すると、1000ミリ秒以上かかったアイコンのみが表示されます。  
フィルタリングのようなものです。

## 視覚化により得られた知見

Reflowにおいて、一番上の一行はやはり選択時間が早いことが分かりました。  
それ以外の部分に関しては、データ数が少ないこともあり、若干ばらつきが多く、信用性が低いデータとなっている気がします。  
今後データ数を増やして色々と確かめていきたいと思います。