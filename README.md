# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Ruby version
  - ruby '2.4.1'
  - rails '5.2.4'

## Gems Implemented
  - gem 'pg', '>= 0.18', '< 2.0'
  - gem 'phonelib'
  - gem 'rspec-rails'
  - gem 'capybara'
  - gem 'launchy'
  - gem 'pry'
  - gem 'simplecov'

## Setup
  - Fork the repository then clone
  - Run `bundle install`
  - Run `rails db:{drop,create,migrate}`

## How to run the test suite
  - Run `rails generate rspec:install`
  - Run `bundle exec rspec`
  - Run `open coverage/index.html` for test coverage
