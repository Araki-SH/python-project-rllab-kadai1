# python-projeckt-rllab-kadai1

### UPDATE [６ July, 2023] : 


## Introduction
~~Pythonチュートリアル荒木本間班の課題1のリポジトリ~~
Pythonチュートリアル荒木本間班の課題2のリポジトリ
This repository is for assignments of M1 tutorial by Robot Learning Lab.   

#### Note :
  - The environment runs on GPU so you must install NVIDIA Container Toolkit.
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html


## 課題について
当グループでは~~課題1~~課題２と課題3を選択した．
### リポジトリの作成  
- 荒木:  
~~課題1~~課題２ （このリポジトリ）
- 本間:  
課題3  https://github.com/TakanoriHomma/python-project-rllab

~~基本的にそれぞれが割り振られたものをすべて担当するが，班内でわからないところがあれば助け合う．~~

### 想定される機能
話し合った結果必要そうなモジュールについて説明
- 共通:
  環境:docker
  MLP
  MNISTの取得
  ハイパーパラメータの調整

- 課題1:  
  ~~式の設定~~
 　　クラスタリング

- 課題3:  
  
  VAE

### タスクの割り振り
負荷が均等になるように次のようにタスクを割り振る  
- 荒木:  
  クラスタリング
  
- 本間:
　 VAE  


## Results
MNIST
-Kadai2/kadai2_MNIST.ipynb

CIFAR-10と考察について
-Kadai2/kadai2_CIFAR10.ipynb



## ディレクトリ構成
```text
python-project-rllab-kadai1
├─Kadai1MLP
│ ├─── README.md               
│ ├─── docker/                     : Dockerセットアップ用
│ │   ├── Dockerfile
│ │   ├── build_docker.sh             : イメージビルド
│ │   └── run_docker.sh               : コンテナ立ち上げ
│ ├── mlp_notebook/           : 課題1
│ └── jupyter_lab_config.py       : JupyterLabの設定ファイル
│
├─Kadai2
  ├─── README.md               
  ├─── docker/                     : Dockerセットアップ用
  │   ├── Dockerfile
  │   ├── build_docker.sh             : イメージビルド
  │   └── run_docker.sh               : コンテナ立ち上げ
  ├── mlp_notebook/           : 課題2
  │　　　　　　├── Kadai2/kadai2_MNIST.ipynb　    :MNIST
  │　　　　　　├──Kadai2/kadai2_CIFAR10.ipynｂ    :CIFAR10
  │ 
  └── jupyter_lab_config.py       : JupyterLabの設定ファイル
```
## セットアップ方法
M1tutorialで使用したDockerファイルを用いて環境を構築している。

### コンテナの立ち上げまで
- `Kadai1MLP/`をまるごとリモート環境または自分が使用する環境の任意のディレクトリに配置する。
- `./Kadai1MLP/docker`に移動して以下のコマンドを打ち込む。ここで、"password"はdocker環境内のユーザのパスワードであり、個々人が個別のものを設定する。
  - 注意点: dockerコマンドを管理者権限なしで実行できると仮定
````shell
$ bash build_docker.sh password
````
- Dockerイメージの構築が終わったら、以下のコマンドを打ち込んでJupyter Labを立ち上げる。
````shell
$ bash run_docker.sh
````
- 画面上に英数字の羅列が表示されるだけだが、起動している。

### Jupyterの初期セットアップ
- まず、以下のコマンドを入力してJupyterLabのtokenを確認する。
```shell
$ docker logs kadai1mlp
```
- 以下に出力例を示す。
  - 末尾から二行目に記載されているURLの`token=`以降がトークンである。これをコピーしておく。
```text
....(省略)....

[I 2023-06-20 16:24:13.211 ServerApp] http://localhost:63322/lab?token=c3f28f67e5c5ab4de25f37fd876ce7b582d70a3068ef2c18
[I 2023-06-20 16:24:13.211 ServerApp]     http://127.0.0.1:63322/lab?token=c3f28f67e5c5ab4de25f37fd876ce7b582d70a3068ef2c18
[I 2023-06-20 16:24:13.211 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 2023-06-20 16:24:13.213 ServerApp] 
    
    To access the server, open this file in a browser:
        file:///home/y-kwon/.local/share/jupyter/runtime/jpserver-1-open.html
    Or copy and paste one of these URLs:
        http://localhost:63322/lab?token=c3f28f67e5c5ab4de25f37fd876ce7b582d70a3068ef2c18
        http://127.0.0.1:63322/lab?token=c3f28f67e5c5ab4de25f37fd876ce7b582d70a3068ef2c18
[I 2023-06-20 16:24:13.224 ServerApp] Skipped non-installed server(s): bash-language-server, dockerfile-language-server-nodejs, javascript-typescript-langserver, jedi-language-server, julia-language-server, pyright, python-language-server, python-lsp-server, r-languageserver, sql-language-server, texlab, typescript-language-server, unified-language-server, vscode-css-languageserver-bin, vscode-html-languageserver-bin, vscode-json-languageserver-bin, yaml-language-server

```
- 次に、Webブラウザ経由でJupyterLabにアクセスする。デフォルトでは`63322`番のポートを使用している。
  - つまり、サーバ側のIPが`163.221.8.11`だとするとブラウザのアドレスバーに`163.221.8.11：63322`と打ち込む。
- 打ち込むとJupyterのログイン画面が表示されるので、下部の**Setup a Password**にあるTokenに先ほどコピーしたトークンを貼り付ける。
- そして、New Passwordに自分のパスワード (冒頭のパスワードとは別で良い)を設定する。次回以降はこのパスワードでログインできる。
- 全て入力できたら、`Log in and set new password`をクリックする。
- 以上でJupyterLabの初期セットアップが完了した。

## その他
- Dockerコンテナを立ち上げたターミナルは閉じることができる。閉じてもコンテナは停止しない。
- Dockerコンテナを停止したい場合には、サーバで以下のコマンドを打ち込む。
```shell
$ docker container stop kadai1mlp 
```
- コンテナを止めるとJupyterの初期設定(パスワード設定など)も消えてしまうので、基本的に止めない。
