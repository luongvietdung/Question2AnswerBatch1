source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.7'
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'bootstrap-sass', '3.3.7'
gem 'will_paginate',           '3.1.6'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'rails-ujs', '~> 0.1.0'
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'acts_as_votable', '~> 0.12.0'
gem 'faker', '~> 1.9', '>= 1.9.3'


gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'font-awesome-rails'

gem 'ckeditor_rails'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'dotenv-rails', groups: [:development, :test]
