# Node実行環境の準備
## Node.jsとnpmのアンインストール

```
$ sudo npm uninstall npm
$ cd ${Node.jsのソースコードを展開したディレクトリ}
$ sudo make uninstall0
```

## naveのインストール
```
$ sudo apt-get install build-essential libssl-dev git-core
$ sudo apt-get install curl
$ mkdir nodejs
$ git clone http://github.com/isaacs/nave.git
$ cd nave
$ ./nave.sh install latest
```

```
$ ./nave.sh use latest
$ node -v
```

