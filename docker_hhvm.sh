#!/bin/sh

#rootユーザーで実行 or sudo権限ユーザー

<<COMMENT
作成者：サイトラボ
URL：https://www.site-lab.jp/
URL：https://www.logw.jp/

COMMENT


start_message(){
echo ""
echo "======================開始======================"
echo ""
}

end_message(){
echo ""
echo "======================完了======================"
echo ""
}

#CentOS7か確認
if [ -e /etc/redhat-release ]; then
    DIST="redhat"
    DIST_VER=`cat /etc/redhat-release | sed -e "s/.*\s\([0-9]\)\..*/\1/"`
    #DIST_VER=`cat /etc/redhat-release | perl -pe 's/.*release ([0-9.]+) .*/$1/' | cut -d "." -f 1`

    if [ $DIST = "redhat" ];then
      if [ $DIST_VER = "7" ];then
        #EPELリポジトリのインストール
        start_message
        yum remove -y epel-release
        yum -y install epel-release
        end_message

        #gitリポジトリのインストール
        start_message
        yum -y install git
        end_message



        # yum updateを実行
        echo "yum updateを実行します"
        echo ""

        start_message
        yum -y update
        end_message

        # dockerのインストール
        start_message
        echo "dockerのインストールをします"
        echo ""
        yum -y install docker
        end_message

        #dockerの起動
        start_message
        echo "dockerの起動と自動起動の設定です"
        echo ""
        systemctl start docker
        systemctl enable docker
        end_message

        #hhvmのダウンロード
        start_message
        echo "hhvmのdockerイメージをダウンロードします"
        echo ""
        docker pull sitelab/hhvm
        echo ""
        echo "hhvmのコンテナを起動します"
        echo ""
        docker run --name hhvm -p 80:80 -p 443:443 -dt sitelab/hhvm /sbin/init
        end_message

        #コンテナの確認
        start_message
        docker ps
        end_message



        cat <<EOF
        ※注意点：環境構築スクリプトのdocker版となります。バージョンは作成時の物となります。
        http://IPアドレス
        https://IPアドレス
        で確認してみてください

        ドキュメントルート(DR)は
        /var/www/html
        となります。

        htaccessはドキュメントルートのみ有効化しています

        有効化の確認

        https://www.logw.jp/server/7452.html
        vi /var/www/html/.htaccess
        -----------------
        AuthType Basic
        AuthName hoge
        Require valid-user
        -----------------
        ダイアログがでればhtaccessが有効かされた状態となります。


        ●HTTP2について
        SSLのconfファイルに｢Protocols h2 http/1.1｣と追記してください
        https://www.logw.jp/server/8359.html

        例）
        <VirtualHost *:443>
            ServerName logw.jp
            ServerAlias www.logw.jp

            Protocols h2 http/1.1　←追加
            DocumentRoot /var/www/html


        <Directory /var/www/html/>
            AllowOverride All
            Require all granted
        </Directory>

        </VirtualHost>

        ドキュメントルートの所有者：centos
        グループ：apache
        になっているため、ユーザー名とグループの変更が必要な場合は変更してください
EOF

      else
        echo "CentOS7ではないため、このスクリプトは使えません。このスクリプトのインストール対象はCentOS7です。"
      fi
    fi

else
  echo "このスクリプトのインストール対象はCentOS7です。CentOS7以外は動きません。"
  cat <<EOF
  検証LinuxディストリビューションはDebian・Ubuntu・Fedora・Arch Linux（アーチ・リナックス）となります。
EOF
fi
exec $SHELL -l
