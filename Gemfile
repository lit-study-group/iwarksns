source 'https://rubygems.org'    # どこからダウンロードするか

gem 'rails', '4.0.3'             # Rails

gem 'sass-rails', '~> 4.0.0'     # CSSのスーパセット
gem 'uglifier', '>= 1.3.0'       # JSの圧縮
gem 'coffee-rails', '~> 4.0.0'   # CoffeeScript
gem 'bootstrap-sass', '~> 3.1.1' # Bootstrap (デザイン用)
gem 'jquery-rails'               # JQuery

gem 'bcrypt-ruby'                # パスワードのハッシュ化用(認証周り)

group :development, :test do
  gem 'sqlite3'                  # 開発用のデータベース
  gem 'jazz_hands'               # コンソールとデバッグツール
end

group :production do
  gem 'pg'                       # プロダクション用のデータベース
end

group :development do
  gem 'better_errors'            # 見やすいエラー画面
  gem 'annotate'                 # モデルでわかりやすいコメントの作成
end
