# M1向けチュートリアル -Python講習 (4)- 資料
## 概要
主にPytorch課題を実行するためのDocker環境及びこれまでの内容確認用のテスト課題を含んだファイル群。
JupyterLab内のノートブックをボリュームとしてマウントするので、コンテナを止めてもデータが消えない。
また、非rootユーザとしてコンテナ内で動くので、rwの権限周りもクリアしている。

## ディレクトリ構成
```text
.
├── README.md               
├── docker/                     : Dockerセットアップ用
│   ├── Dockerfile
│   ├── build_docker.sh             : イメージビルド
│   └── run_docker.sh               : コンテナ立ち上げ
├── pytorch_notebook/           : Pytorch課題
│   ├── 0_basics/                   : Intro to Pytorch (from official tutorials)
│   ├── 1_intro_to_pytorch/         : Intro to Pytorch on YouTube (from official tutorials)
│   ├── 2_RL_with_pytorch           : RL tutorials (from official tutorials)
│   └── _static                     : ノートブックに表示する画像などを格納
├── jupyter_lab_config.py       : JupyterLabの設定ファイル
└── exam_notebook/              : これまでの内容を確認するテスト課題
```
## セットアップ方法
### コンテナの立ち上げまで
- `TorchJupyterEnv/`をまるごとリモート環境または自分が使用する環境の任意のディレクトリに配置する。
- `./TorchJupyterEnv/docker`に移動して以下のコマンドを打ち込む。ここで、"password"はdocker環境内のユーザのパスワードであり、個々人が個別のものを設定する。
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
$ docker logs torch_on_jupyter
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
$ docker container stop torch_on_jupyter 
```
- コンテナを止めるとJupyterの初期設定(パスワード設定など)も消えてしまうので、基本的に止めない。