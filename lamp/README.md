# amazonlinux2023

- OS：amazonlinux2023
- WEBサーバー：Apache
- PHP：8.3
- MySQL：8系
- share：コンテナに置きたいファイルをここに置く

### イメージサイズ
- WEBサーバー：364M
- php：751M

### 使い方

**コンテナ起動**

`docker compose  up -d`

**コンテナ停止**

`docker compose  down`

**コンテナログイン**

`docker exec -it コンテナID(コンテナ名) /bin/bash`

**コンテナ起動確認**

`docker ps -a`