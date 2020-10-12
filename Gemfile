source 'https://rubygems.org'

ruby '2.7.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap-sass'
gem 'devise'
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'devise-bootstrap-views'
gem 'administrate'
gem 'bourbon'
gem 'pundit'
gem 'font-awesome-sass'
gem 'twilio-ruby'
gem 'kaminari'
gem 'exception_notification', group: :production # отправляет все ошибки Heroku на почту
gem 'newrelic_rpm'
gem 'rails-erd', group: :development

group :development, :test do
  gem 'byebug'
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'sqlite3', '~> 1.4'
  gem 'database_cleaner-active_record'
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
