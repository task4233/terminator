source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '5.1.6'                       # Rails
gem 'sqlite3', '1.3.13'                    # SQL(Database)
gem 'bcrypt', '3.1.12'                     # パスワードの暗号化
gem 'faker', '1.4.2'                       # ダミーデータ生成
gem 'will_paginate', '3.1.5'               # ページネート用
gem 'bootstrap-will_paginate', '0.0.10'    # ページネート用
gem 'bootstrap-sass', '3.3.7'              # bootstrap用のsass
gem 'puma', '3.9.1'                        # Webサーバを立てる
gem 'sass-rails', '5.0.6'                  # sass用
gem 'uglifier', '3.2.0'                    # JavaScriptの軽量化ライブラリUglifyJS2を使用できるようにする
gem 'coffee-rails', '4.2.2'                # CoffeeScript
gem 'turbolinks', '5.0.1'                  # ページ遷移をAjaxに置き換えて高速化する
gem 'jbuilder', '2.7.0'                    # API用のjsonテンプレートエンジン
gem 'jquery-rails'                         # jquery
gem 'omniauth-twitter'                     # Twitter Authentication
gem 'foreman'                              # サーバを立てる時に, まとめてコマンド実行
gem 'devise'                               # 認証系が楽になるもの
gem 'dotenv-rails'                         # 環境変数用


group :development, :test do
  gem 'byebug', '9.0.6', platforms: :mri   # debug
end

group :development do
  gem 'web-console', '3.5.1'               # Web上でコンソールを表示
  gem 'listen', '3.1.5'                    # ファイルの変更を検知してそれをトリガとして処理ができる
  gem 'spring', '2.0.2'                    # テスト等を高速化
  gem 'spring-watcher-listen', '2.0.1'     # springにrspecを追加してrspecを高速化
end

group :test do
  gem 'rails-controller-testing', '1.0.2'  #  
  gem 'minitest', '5.10.3'                 # minitest
  gem 'minitest-reporters', '1.1.14'       # minitest
  gem 'guard', '2.13.0'                    # for test
  gem 'guard-minitest', '2.4.4'            # for test
end

group :production do    
  gem 'pg', '0.20.0'                       # Postgresql
  gem 'rails_12factor', '0.0.2'            # Heroku
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
