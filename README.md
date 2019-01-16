# dockerイメージ

dockerイメージのシェルを置いておきます。基本的にdockerのインストールと、必要なコンテナをダウンロードしてインストールします
※基本的に1コンテナで全て解決しています
環境構築スクリプトのdocker版となります

## テスト環境
### conohaのVPS
* メモリ：512MB
* CPU：1コア
* SSD：20GB

### さくらのVPS
* メモリ：512MB
* CPU：1コア
* SSD：20GB

### さくらのクラウド
* メモリ：1GB
* CPU：1コア
* SSD：20GB

### 実行方法
SFTPなどでアップロードをして、rootユーザーもしくはsudo権限で実行
wgetを使用する場合は[環境構築スクリプトを公開してます](https://www.logw.jp/cloudserver/8886.html)を閲覧してください。
wgetがない場合は **yum -y install wget** でインストールしてください

**sh ファイル名.sh** ←同じ階層にある場合

**sh /home/ユーザー名/ファイル名.sh** ユーザー階層にある場合（rootユーザー実行時）

## [docker_hhvm.sh](https://github.com/site-lab/docker/docker_hhvm.sh)
apache+hhvmのインストールをします。
* apache2.4.6
* hhvm

このイメージは、**apache_hhvm.sh** のdocker版となります
