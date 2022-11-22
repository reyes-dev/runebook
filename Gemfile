source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-rails_csrf_protection'
gem 'paperclip-cloudinary'
gem 'cloudinary'
gem "figaro"
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'main'
gem "chromedriver-helper"

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'webdrivers'
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'web-console'
  gem 'bullet'
  gem 'letter_opener'
end

group :test do
  gem "selenium-webdriver"
end

gem "hotwire-livereload", "~> 1.2", :group => :development
