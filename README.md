# engsuribt
東京大学工学部計数工学科・大学院情報理工学系研究科数理情報学専攻およびシステム情報学専攻で用いられている卒論・修論用LaTeXスタイルファイル`suribt.cls`の非公式英語版です．
欧文組版として不自然にならない範囲で`suribt.cls`に近い出力を得られるようにしていますが，自己責任で使用してください．

## 特徴
- オリジナルの文書クラスとして`suribt.cls`は`jsbook.cls`を利用しますが，`engsuribt.cls`は`book.cls`を利用します．
- これにより，`suribt.cls`は(u)pLaTeXをエンジンとして要求する一方，`engsuribt.cls`はLaTeXやpdfLaTeXでもコンパイル可能となっています．おすすめはpdfLaTeXです．

## 使い方
```latex
\documentclass[suri]{engsuribt}
```
オプションは`mi`, `suri`, `ipc`, `system`の中から該当する一つを選択してください．

## その他クラスオプション
- `pdfbookmark`：Cover Page, Abstract, ContentsのPDFブックマークを追加するようになります．
- `dvipdfmx`：`book.cls`のオプションに`dvipdfmx`を追加するようになります．(u)pLaTeXを使う方は指定してください．

詳しくは[`sample.tex`](sample.tex)を参考にしてください．
