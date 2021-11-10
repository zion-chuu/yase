# 開発環境の準備について

1. dockerをインストールします[こちら](https://www.docker.com/docker-mac)  
2. アプリケーションのrootへ  
.envファイルを作成(これは開発者に依賴して受け取ってください)  
3. コマンドを実行  
make build
make server
これでコンテナを起動

```
//dumpの取り込み
$docker exec -i limemedia_db_1 mysql -u mysql -pexample -D yaselabo_development < dump{{日付}}.sql
```

http://localhost:3000  
へアクセスして、topが見れたらOK


4. 停止する時はCtrl + c

## dockerコマンドに疲れたので
makeファイルを作成しました

make consoleみたいに打つと、内部で右側のコマンドが実行されます
```
make console          docker exec -it yaselabo_rails_1 /bin/bash
make dbconsole        docker exec -it yaselabo_db_1 /bin/bash
make delete           docker conrainer rm yaselabo_rails_1
make help             show help
make redisconsole     docker exec -it yaselabo_redis_1 /bin/bash
make server           docker-compose run --rm --name yaselabo_rails_1 -p 3000:3000 rails
```

## 本番反映のフロー

```
.envを設置or追加  
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake db:seed
RAILS_ENV=production bundle exec rake assets:precompile
RAILS_ENV=production bundle exec rake sitemap:refresh:no_ping
sudo service unicorn restart
```

## Gitの運用について

コミットメッセージには「プレフィックス」をつけてください
(AngularJS開発者ガイドからインスパイア)
e.g. 
"feat: 世界で１番素晴らしい機能の追加"
"fix: クソみたいなtypoを修正"
"docs: READMEにコミットメッセージについて書いた"

Must be one of the following:

* feat: A new feature
* fix: A bug fix
* docs: Documentation only changes
* style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
* refactor: A code change that neither fixes a bug nor adds a feature
* perf: A code change that improves performance
* test: Adding missing or correcting existing tests
* chore: Changes to the build process or auxiliary tools and libraries such as documentation generation
