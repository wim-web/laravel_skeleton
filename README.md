# laravel_skelton

Laravelをすばやく始めるためのスケルトンプロジェクトです。

![php_version_7.4](https://img.shields.io/badge/PHP-7.4-green)
![nginx_version_1.7](https://img.shields.io/badge/Nginx-1.19-green)
![mysql_version_8.0](https://img.shields.io/badge/MySQL-8.0-green)
![node_version_14.2](https://img.shields.io/badge/Node-14.2-green)

## コンテナの構成

- php-fpm
- nginx
- mysql
- workspace(artisan, phpunit, npmなどを実行する)

## はじめかた

1. `.env`を作成

`.env.sample`をコピーして、`.env`を作成し、項目を埋めてください

```
cp .env.sample .env
```

- APP_DIR : プロジェクトルートへのPATH
- CONTAINER_DIR : コンテナ内のプロジェクトルート
- COMPOSE_PROJECT_NAME : docker-composeで使用される環境変数(https://docs.docker.com/compose/reference/envvars/)

2. Laravelをインストール

以下のコマンドでworkspaceに入り、

```
make work
```

LaravelをDLします

```
composer create-project --prefer-dist laravel/laravel .
```

nginxにアクセスしLaravelの初期画面が出れば成功！

※この作業の前に `docker-compose up` や `make up` をするとディレクトリが作成されてしまい、Laravelをインストールできなくなります

## Makefile

よく使うコマンドをまとめています

- `make mysqld` : mysqlコンテナ内のmysqlにログインします

- `make database arg=name` : nameで指定したdatabaseを作成します

- `make work` : workspaceに入ります

## Workspaceでのalias

- `artisan` : `php artisan`

- `test` : `./vendor/bin/phpunit`


