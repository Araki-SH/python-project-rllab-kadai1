# python-project-rllab-kadai1

### UPDATE [4 July, 2023] : 


## Introduction
Pythonチュートリアル荒木本間班の課題3のリポジトリ  
This repository is for assignments of M1 tutorial by Robot Learning Lab.   

## 課題について
当グループでは課題1と課題3を選択した．  

### リポジトリの作成  
- 荒木:  
課題1（このリポジトリ）
- 本間:  
課題3  https://github.com/TakanoriHomma/python-project-rllab  


### 想定される機能
話し合った結果必要そうなモジュールについて説明
- 課題1:

- 課題3:

### タスクの割り振り
負荷が均等になるように次のようにタスクを割り振る  
- 荒木:  

- 本間:  


## Results
課題で得られた結果があれば載せる


## Dependencies



## References


## Directory Structure
M1-tutorialで使用した"ToruchJupter.zip"を元に作成したファイルを利用している．
```text
.
├── README.md               
├── docker/                     : Dockerセットアップ用
│   ├── Dockerfile
│   ├── build_docker.sh             : イメージビルド
│   └── run_docker.sh               : コンテナ立ち上げ
└── mpl_notebook/           : kadai1_mpl
    └── mpl.py/                     : main.py

```

#### Note :
  - The environment runs on GPU so you must install NVIDIA Container Toolkit.
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html



## Set Up Method

### Container start-up  
- `Kadai1MPL/`を任意のディレクトリに配置する．
- `./Kadai1MPL/docker`に移動し，以下のコマンドを打ち込む．
"password"はdocker環境内のユーザのパスワードである．
````shell
$ bash build_docker.sh password
````
- Dockerイメージの構築の数分かかる．
- Dockerイメージの構築終了後、以下のコマンドを打ち込んでJupyter Labを立ち上げる．
````shell
$ bash run_docker.sh
````
- 画面上に英数字の羅列のみが表示された場合、起動成功．

### Jupyterの初期セットアップ
- まず、以下のコマンドを入力してJupyterLabのtokenを確認する．
```shell
$ docker logs Kadai1MPL
```
- 以下に出力例を示す。
  - 末尾から二行目に記載されているURLの`token=`以降がトークンである。これをコピーしておく．
```text
....(省略)....

token=c3f28f67e5c5ab4de25f37fd876ce7b582d70a3068ef2c18
[I 2023-06-20 16:24:13.211 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 2023-06-20 16:24:13.213 ServerApp] 
    
    To access the server, open this file in a browser:
        file:///home/y-kwon/.local/share/jupyter/runtime/jpserver-1-open.html
    Or copy and paste one of these URLs:
        http://localhost:63322/lab?token=c3f28f67e5c5ab4de25f37fd876ce7b582d70a3068ef2c18
        http://127.0.0.1:63322/lab?token=c3f28f67e5c5ab4de25f37fd876ce7b582d70a3068ef2c18
[I 2023-06-20 16:24:13.224 ServerApp] Skipped non-installed server(s): bash-language-server,

....(省略)....
```
- 次に、Webブラウザ経由でJupyterLabにアクセス。デフォルトでは`63322`番のポートを使用．
  - 自身のサーバ側のIP`163.221.133.11`の後ろに`:63322`を追加し，`163.221.133.11：63322`と打ち込む．
- 打ち込むとJupyterのログイン画面が表示されるため，Tokenに先ほど`Token=`の後ろから取得したトークンを貼り付ける．もしくは，下部にスクロールし，TokenとNew Passwordにそれぞれ入力する．次回以降はこのパスワードでログイン可能．
- 全て入力できたら、`Log in and set new password`をクリックする．
- 以上でJupyterLabの初期セットアップが完了．

## その他
- 終了する場合，Dockerコンテナを立ち上げたターミナルは閉じる．注意点として，ターミナルを閉じてもコンテナは停止しない．
- Dockerコンテナを停止したい場合は、サーバで以下のコマンドを打ち込む．
```shell
$ docker container stop Kadai1MPL
```
- コンテナを止めるとJupyterの初期設定(パスワード設定など)も消えるため，基本的に止める必要はない．