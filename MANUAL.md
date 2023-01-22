## Components
### layouts/layout.xml
ウォッチフェイス上のオブジェクト配置とスタイルを決める。一番重要

### Layout
https://developer.garmin.com/connect-iq/core-topics/layouts/
- WatchUi.Drawable オブジェクトとして定義されている。
- layouts/layout.xml に記載することで、コード変更なしにレイアウト記述可能
- View.setLayout() の中で View.onLayout()を呼ぶことで適用可能
- 親の View.OnUpdate を呼ぶことで画面更新される


### 描画系
~/Library/Application%20Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-4.0.10-2022-02-08-277ce4444/CoreTopics.html#graphics


## SDK References 確認
cd ~/Library/Application\ Support/Garmin/ConnectIQ/Sdks/

point
- アプリ実行時に、開発者はシステムが「持っている」機能を尋ねることができます
    - 特定デバイスにしかない機能の使用などは最初に場合分けできる
- パスを通せばコマンドライン実行もできるっぽい
```bash
export PATH=$PATH:`cat $HOME/Library/Application\ Support/Garmin/ConnectIQ/current-sdk.cfg`/bin
```

```commands
monkeyc [-d <arg>] [-f <arg>] [-o <arg>] [-y <arg>]
```

- サンプルのインポート
```
ls -l ~/Library/Application\ Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-4.1.7-2022-11-21-562b8a195/samples
```

- WatchFace で使える API
    - ActivityMonitor
    - Application
    - Background (バックグラウンドタスク？)
    - BluetoothLowEnergy
    - Cryptgraphy
    - Graphics
    - Lang
    - Math
    - SensorHistory
    - StringUtil
    - System
    - Test
    - Time
    - Timer
    - UserProfile
    - WatchUi
    - Weather

- WatchFace はバッテリー消費を抑えるために機能が少なめ
- デザインが悪いと、バッテリー消費が増加する
- WatchFace のライフサイクルは　通常時→スリープ時→（腕を上げる）→通常時　となる
```
ウォッチフェイスは、このモードの「スリープ モード」で大部分の時間を費やします。実行は 1 分ごとに 1 回の更新に制限され、タイマーやアニメーションは使用できません。 ユーザーが時計を見るために持ち上げると、時計の文字盤はスリープ モードを終了します。 これが発生すると、WatchFace.onExitSleep() メソッドが呼び出され、更新が 1 秒に 1 回に増え、WatchFace.onEnterSleep() メソッドが呼び出されるまでタイマーとアニメーションが許可されます。
```
- Delegate はシステム→watchgace のアクセスを管理。ユーザーは気にしなくてOK

- Debug.log への出力方法
```
System.println( "Hello Monkey C!" );
```
- Monkey C にはプリミティブ型がありません
- Monkey C は、仮想マシンによって解釈されるバイト コードにコンパイルされます。 また、Java と同様に、すべてのオブジェクトがヒープに割り当てられ、仮想マシンがメモリをクリーンアップ(参照カウントによる)
- Monkey C でコールバックを作成するには、Method オブジェクトを作成します。
- Monkey C は参照カウントされます。つまり、メモリを参照するオブジェクトの数がゼロになると、ランタイム システムはメモリを解放します。

- API Docs
~/Library/Application%20Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-4.0.10-2022-02-08-277ce4444/doc/index.html

- Dc : デバイスコンテキストの略。描画するためのメソッドを含む : Drawable に描画する　
- permission 設定が必要

### components
- label : テキスト
    - justification : 配置の基準位置。`Graphics.TEXT_JUSTIFY_CENTER`使えば大体OK
    - font : フォント. Graphics クラスに含まれる定数 or 外部で定義した時のユーザーID
    - x,y 座標。指定する値は以下
        - pixel value
        - a relative position using ‘%’
        - 文字列 `center`, `left`, `right`, `start`
        - colo : Graphics クラスに含まれる定数 or `0xRRGGBB`
- textarea
- drawables : ビットマップもしくは XML リソース
- drawable-list  : ビットマップもしくは XML リソースのリスト
    - shape
    - bitmap
    - drawable はサンプルアップを見るのが良いとのこと
- shape : 図形：短形
- bitmap : 画像：パスでファイル名を指定する