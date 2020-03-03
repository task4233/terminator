source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '6.0.0'                       # Rails
gem 'bcrypt', '3.1.13'                     # パスワードの暗号化
gem 'faker', '2.2.0'                       # ダミーデータ生成
gem 'will_paginate', '3.1.8'               # ページネート用
gem 'bootstrap-will_paginate', '1.0.0'     # ページネート用
gem 'bootstrap-sass', '3.4.1'              # bootstrap用のsass
gem 'puma', '4.3.3'                        # Webサーバを立てる
gem 'sass-rails', '6.0.0'                  # sass用
gem 'uglifier', '4.1.20'                    # JavaScriptの軽量化ライブラリUglifyJS2を使用できるようにする
gem 'coffee-rails', '5.0.0'                # CoffeeScript
gem 'turbolinks', '5.2.0'                  # ページ遷移をAjaxに置き換えて高速化する
gem 'jbuilder', '2.9.1'                    # API用のjsonテンプレートエンジン
gem 'jquery-rails'                         # jquery
gem 'omniauth-rails_csrf_protection'       # Twitter Authentication
gem 'foreman'                              # サーバを立てる時に, まとめてコマンド実行
gem 'devise'                               # 認証系が楽になるもの
gem 'dotenv-rails'                         # 環境変数用
gem 'twitter'                              # Twitter Bot用
gem 'google-analytics-rails'               # Google Analytics
gem 'whenever'                             # 自動tui

group :development, :test do
  gem 'sqlite3', '1.4.1'                  # SQL(Database)
  gem 'byebug', '11.0.1', platforms: :mri # debug
end
 
group :development do
  gem 'web-console', '4.0.1'               # Web上でコンソールを表示
  gem 'listen', '3.1.5'                    # ファイルの変更を検知してそれをトリガとして処理ができる
  gem 'spring', '2.1.0'                    # テスト等を高速化
  gem 'spring-watcher-listen', '2.0.1'     # springにrspecを追加してrspecを高速化
end

group :test do
  gem 'rails-controller-testing', '1.0.4'  #  
  gem 'minitest', '5.11.3'                 # minitest
  gem 'minitest-reporters', '1.3.8'        # minitest
  gem 'guard', '2.15.1'                    # for test
  gem 'guard-minitest', '2.4.6'            # for test
end

group :production do    
  gem 'pg', '1.1.4'                        # Postgresql
  gem 'rails_12factor', '0.0.3'            # Heroku
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
