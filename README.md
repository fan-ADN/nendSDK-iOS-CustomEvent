# nendSDK-iOS-AdMob-CustomEvent

![ロゴ](https://github.com/fan-ADN/nendSDK-iOS/blob/master/Sample/NendSDK_Sample/Images.xcassets/AppIcon.appiconset/icon-60%403x.png)

## Overview
nendSDKのiOS版AdMobメディエーション用カスタムイベントアダプタです。  
AdMobメディエーションを利用時に、このカスタムイベントアダプタを使うことでnendSDKのリワード動画を表示することができます。  
ここでは、アダプタを利用するためのカスタムイベントに関する説明、サンプルプロジェクトによる動作の確認が行えます。  

## Requirement
- Google Mobile Ads SDK 7.14.0 or higher
- iOS 8.1 or higher
- Xcode 7.0 or higher

## Usage

### 動画リワードカスタムイベントの作成
1. [動画リワード広告: パブリッシャー向けスタートガイド](https://firebase.google.com/docs/admob/ios/rewarded-video) にならい、動画リワードメディエーションの使用準備を行います。
2. [動画リワード広告アダプタの実装](https://firebase.google.com/docs/admob/ios/rewarded-video-adapters#create_a_custom_event) の 「カスタム イベントの作成」 セクションに従い、カスタムイベント を下記設定で作成してください。
<table>
  <caption>カスタムイベント</caption>
  <tr>
    <th>Class Name</th>
    <th>Label</th>
    <th>Parameter</th>
  </tr>
  <tr>
    <td><code>GADMAdapterNendRewardedVideo</code></td>
    <td>任意</td>
    <td>{ "spotId": "Your Spot Id", "apiKey": "Your Api Key" }<br><br>※例)<code>spotId</code>が「1234」、<code>apiKey</code>が「ABCDEF」の場合は<code>{ "spotId": "1234", "apiKey": "ABCDEF" }</code>となります</td>
  </tr>
</table>

### `nendSDK`と`メディエーションアダプター`と`admobSDK`をプロジェクトに追加する
#### CocoaPodsから追加する場合

1. [CocoaPods](https://guides.cocoapods.org/using/getting-started) を事前にインストールする
2. Podfile を作成する
3. 作成されたPodfileに以下の記述を追加する
```
platform :ios, "8.1"
pod 'NendMediationCustomEventAdapter'
```
4. `pod install` を実行する

#### 手動で追加する場合

以下の手順でプロジェクトにSDKを追加します。

1. [AdMob for iOS](https://developers.google.com/admob/ios/download) をダウンロードしプロジェクトに追加する
2. [nendSDK-iOS](https://github.com/fan-ADN/nendSDK-iOS)  - [SDKを手動で追加する](https://github.com/fan-ADN/nendSDK-iOS/wiki/SDKを手動で追加する) の手順に従い nendSDKをプロジェクトに追加する
3. [こちら](https://github.com/fan-ADN/nendSDK-iOS-AdMob-CustomEvent/releases)からアダプターをダウンロードしてプロジェクトに追加する

## オプション設定
### ユーザーID
`GADMAdapterNendExtras`の`userId`プロパティにゲームやアプリで使用しているIDをセットすることによって、nend のユーザー管理に役立ちます。
```objc
GADRequest *request = [GADRequest request];
GADMAdapterNendCustomEventExtras *extras = [[GADMAdapterNendCustomEventExtras alloc] init];
extras.userId = @"ID used in games and applications";
[request registerAdNetworkExtras:extras];
```

## Sample
1. 本サンプルをgit cloneまたはzipをダウンロードし、Xcode8.0以上で開いてください。
2. ソースコードのユニットIDをAdMob広告ユニットIDに書き換えてください。


