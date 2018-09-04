Ansible on GCP ハンズオン
===
## 初めに
* このリポジトリは、Ansible on GCP ハンズオンで利用するソースコードをまとめたリポジトリとなります。
* insntance-deployに含まれているTerraformのコードで作成するGCEは、fi-microのプリミティブVMとなります。

## ファイル構成  
  
| ディレクトリ名  | 内容  |
| :-- | :-- |
| handson-1  | httpdをインストールするPlaybookを含む  |
| handson-2  | 変数、ループを利用しhttpdをインストールするPlaybookを含む |
| handson-3  | ロールベースのPlaybookを含む |
| instance-deploy | GCEを作成するファイルを含む |
  
## 実行方法  
対象ホストへSSH接続可能であることを確認後、Gitリポジトリをcloneし`ansible_demo`ディレクトリへ移動します。移動後、`inventory`ファイルを作成し、`handson-playbook`を実行します。  
実行後、`delete-playbook`を実行し環境を初期化します。

```
$ git clone https://github.com/ptpt-free/ansible_demo.git
$ cd ansible_demo/
$ vi inventory
$ cat inventory
  [web]
  "GCEのIPアドレス"
$ ansible-playbook -i inventory handson-1/handson-playbook1.yml --syntax-check
$ ansible-playbook -i inventory handson-1/handson-playbook1.yml --check
$ ansible-playbook -i inventory handson-1/handson-playbook1.yml 
$ ansible-playbook -i inventory handson-1/delete-playbook1.yml
```


