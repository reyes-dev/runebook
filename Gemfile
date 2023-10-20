source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'bootsnap', require: false
gem 'cloudinary'
gem 'devise'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'main'
gem 'figaro'
gem 'importmap-rails'
gem 'jbuilder'
gem 'omniauth-facebook'
gem 'omniauth-rails_csrf_protection'
gem 'paperclip-cloudinary'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'redis', '~> 4.0'
gem 'selenium-webdriver'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'capybara'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'guard-rspec'
  gem 'rspec-rails'
end

group :development do
  gem 'bullet'
  gem 'letter_opener'
  gem 'web-console'
end

group :test do
end

gem 'hotwire-livereload', '~> 1.2', group: :development

gem 'dockerfile-rails', '>= 1.2', group: :development
