# 環境構築手順
1. レポジトリーをローカルに持ってくる
```
git clone <this repo>
```

2. レポジトリーのディレクトリに遷移
```
cd <this repo>
```

3. コンテナの作成と起動(初回時はdocker image作成のためbuildも実行されます)
```
docker-compose up
```

4. docker-compose upの出力結果例
```
github.com/username/repository$ docker-compose up
Creating network "rails-docker_internal" with the default driver
Creating network "web_network" with the default driver
Creating volume "rails-docker_db-data" with default driver
Pulling db (postgres:12)...
12: Pulling from library/postgres
26c5c85e47da: Pull complete
1c30a4c3f519: Pull complete
d5c0f1ae682d: Pull complete
1b1b2890ec0f: Pull complete
391087799df7: Pull complete
b413b4057e31: Pull complete
4fa4edfeab8b: Pull complete
b0a4d596bc61: Pull complete
78975885f6ac: Pull complete
ffcfb55e4979: Pull complete
1f26af0a2913: Pull complete
5d39f95eb55c: Pull complete
d2ddfb1ea0bf: Pull complete
Digest: sha256:cd129ab384ea5b73196959b2f91ef7ccc0e6876f7199b9051d90f72c9e1f5d72
Status: Downloaded newer image for postgres:12
Building web
[+] Building 139.1s (18/18) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                     0.0s
 => => transferring dockerfile: 37B                                                                                                                      0.0s
 => [internal] load .dockerignore                                                                                                                        0.0s
 => => transferring context: 34B                                                                                                                         0.0s
 => [internal] load metadata for docker.io/library/ruby:3.0                                                                                              1.7s
 => [internal] load metadata for docker.io/library/node:16.20.0-bullseye                                                                                 1.7s
 => [auth] library/node:pull token for registry-1.docker.io                                                                                              0.0s
 => [auth] library/ruby:pull token for registry-1.docker.io                                                                                              0.0s
 => [internal] load build context                                                                                                                        9.9s
 => => transferring context: 82.94MB                                                                                                                     9.8s
 => [node 1/1] FROM docker.io/library/node:16.20.0-bullseye@sha256:607ceec2510f407a0fea60fcd7b38ba3a4cdb63e2e0bfa07e6ae890f48309db5                      0.0s
 => [stage-1 1/9] FROM docker.io/library/ruby:3.0@sha256:0e4d5977b4e6627707d1ac7771a5ca7bcc55ab7908a4a3be7e23efafc54977f1                                0.0s
 => CACHED [stage-1 2/9] COPY --from=node /opt/yarn-* /opt/yarn                                                                                          0.0s
 => CACHED [stage-1 3/9] COPY --from=node /usr/local/bin/node /usr/local/bin/                                                                            0.0s
 => CACHED [stage-1 4/9] COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/                                                      0.0s
 => CACHED [stage-1 5/9] RUN ln -fs /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm   && ln -fs /usr/local/lib/node_modules/npm/bin/n  0.0s
 => CACHED [stage-1 6/9] RUN apt-get update && apt-get install -y   build-essential   libpq-dev   postgresql-client                                      0.0s
 => CACHED [stage-1 7/9] WORKDIR /myapp                                                                                                                  0.0s
 => [stage-1 8/9] COPY . /myapp/                                                                                                                         5.9s
 => [stage-1 9/9] RUN bundle install && yarn install                                                                                                   118.5s
 => exporting to image                                                                                                                                   2.8s
 => => exporting layers                                                                                                                                  2.8s
 => => writing image sha256:f9707bc03bf98795def99c0780d48e4ec0ac564e71e7b7a85b6f6c5c078331c6                                                             0.0s
 => => naming to docker.io/library/rails-docker_web                                                                                                      0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
WARNING: Image for service web was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating rails-docker_db_1 ... done
Creating rails-docker_web_1 ... done
Attaching to rails-docker_db_1, rails-docker_web_1
db_1   | The files belonging to this database system will be owned by user "postgres".
db_1   | This user must also own the server process.
db_1   |
db_1   | The database cluster will be initialized with locale "en_US.utf8".
db_1   | The default database encoding has accordingly been set to "UTF8".
db_1   | The default text search configuration will be set to "english".
db_1   |
db_1   | Data page checksums are disabled.
db_1   |
db_1   | fixing permissions on existing directory /var/lib/postgresql/data ... ok
db_1   | creating subdirectories ... ok
db_1   | selecting dynamic shared memory implementation ... posix
db_1   | selecting default max_connections ... 100
db_1   | selecting default shared_buffers ... 128MB
db_1   | selecting default time zone ... Etc/UTC
db_1   | creating configuration files ... ok
db_1   | running bootstrap script ... ok
db_1   | performing post-bootstrap initialization ... ok
db_1   | syncing data to disk ... initdb: warning: enabling "trust" authentication for local connections
db_1   | You can change this by editing pg_hba.conf or using the option -A, or
db_1   | --auth-local and --auth-host, the next time you run initdb.
db_1   | ok
db_1   |
db_1   |
db_1   | Success. You can now start the database server using:
db_1   |
db_1   |     pg_ctl -D /var/lib/postgresql/data -l logfile start
db_1   |
db_1   | waiting for server to start....2023-04-26 02:06:35.384 UTC [48] LOG:  starting PostgreSQL 12.14 (Debian 12.14-1.pgdg110+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 10.2.1-6) 10.2.1 20210110, 64-bit
db_1   | 2023-04-26 02:06:35.386 UTC [48] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1   | 2023-04-26 02:06:35.405 UTC [49] LOG:  database system was shut down at 2023-04-26 02:06:34 UTC
db_1   | 2023-04-26 02:06:35.412 UTC [48] LOG:  database system is ready to accept connections
db_1   |  done
db_1   | server started
db_1   |
db_1   | /usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*
db_1   |
db_1   | waiting for server to shut down...2023-04-26 02:06:35.581 UTC [48] LOG:  received fast shutdown request
db_1   | .2023-04-26 02:06:35.584 UTC [48] LOG:  aborting any active transactions
db_1   | 2023-04-26 02:06:35.587 UTC [48] LOG:  background worker "logical replication launcher" (PID 55) exited with exit code 1
db_1   | 2023-04-26 02:06:35.588 UTC [50] LOG:  shutting down
db_1   | 2023-04-26 02:06:35.614 UTC [48] LOG:  database system is shut down
db_1   |  done
db_1   | server stopped
db_1   |
db_1   | PostgreSQL init process complete; ready for start up.
db_1   |
db_1   | 2023-04-26 02:06:35.734 UTC [1] LOG:  starting PostgreSQL 12.14 (Debian 12.14-1.pgdg110+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 10.2.1-6) 10.2.1 20210110, 64-bit
db_1   | 2023-04-26 02:06:35.734 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db_1   | 2023-04-26 02:06:35.735 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db_1   | 2023-04-26 02:06:35.768 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1   | 2023-04-26 02:06:35.791 UTC [68] LOG:  database system was shut down at 2023-04-26 02:06:35 UTC
db_1   | 2023-04-26 02:06:35.797 UTC [1] LOG:  database system is ready to accept connections
web_1  |    identical  config/webpacker.yml
web_1  | Copying webpack core config
web_1  |        exist  config/webpack
web_1  |    identical  config/webpack/development.js
web_1  |    identical  config/webpack/environment.js
web_1  |    identical  config/webpack/production.js
web_1  |    identical  config/webpack/test.js
web_1  | Copying postcss.config.js to app root directory
web_1  |    identical  postcss.config.js
web_1  | Copying babel.config.js to app root directory
web_1  |    identical  babel.config.js
web_1  | Copying .browserslistrc to app root directory
web_1  |    identical  .browserslistrc
web_1  | The JavaScript app source directory already exists
web_1  |        apply  /usr/local/bundle/gems/webpacker-5.4.4/lib/install/binstubs.rb
web_1  |   Copying binstubs
web_1  |        exist    bin
web_1  |    identical    bin/webpack
web_1  |    identical    bin/webpack-dev-server
web_1  | File unchanged! The supplied flag value not found!  .gitignore
web_1  | Installing all JavaScript dependencies [5.4.4]
web_1  |          run  yarn add @rails/webpacker@5.4.4 from "."
yarn add v1.22.19
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Saved 0 new dependencies.
Done in 170.15s.
web_1  | Installing webpack and webpack-cli as direct dependencies
web_1  |          run  yarn add webpack@^4.46.0 webpack-cli@^3.3.12 from "."
yarn add v1.22.19
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Saved 0 new dependencies.
Done in 14.09s.
web_1  | Installing dev server for live reloading
web_1  |          run  yarn add --dev webpack-dev-server@^3 from "."
yarn add v1.22.19
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Saved 0 new dependencies.
Done in 11.36s.
web_1  | Webpacker successfully installed 🎉 🍰
web_1  | Everything's up-to-date. Nothing to do
web_1  | Created database 'myapp_development'
web_1  | Created database 'myapp_test'
web_1  | == 20230221092316 CreateTasks: migrating ======================================
web_1  | -- create_table(:tasks)
web_1  |    -> 0.0179s
web_1  | == 20230221092316 CreateTasks: migrated (0.0181s) =============================
web_1  |
web_1  | => Booting Puma
web_1  | => Rails 6.0.6.1 application starting in development
web_1  | => Run `rails server --help` for more startup options
web_1  | Puma starting in single mode...
web_1  | * Version 4.3.12 (ruby 3.0.6-p216), codename: Mysterious Traveller
web_1  | * Min threads: 5, max threads: 5
web_1  | * Environment: development
web_1  | * Listening on tcp://0.0.0.0:3000
web_1  | Use Ctrl-C to stop

```

5. 立ち上がったサイトにアクセス(自身のネットワーク:3000番ポートにアクセス)
```
0.0.0.0:3000
```

6. 0.0.0.0:3000にブラウザからアクセスした際のスクリーンショット

※ 以下のようにTasksページが表示されていたら環境構築成功です。お疲れ様でした

<img width="957" alt="スクリーンショット 2023-04-26 11 16 50" src="https://user-images.githubusercontent.com/88125637/234449119-ba5a447e-b0fb-4277-8c97-0e8d7ed09286.png">
