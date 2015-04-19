
[![Build Status](https://travis-ci.org/kashiro/rails-mongodb-playground.svg)](https://travis-ci.org/kashiro/rails-mongodb-playground)

# mongoid playground

This is playground for mongoid.
This application have only Model and Spec files.

## Install and Start

```bash
$ bundle install
$ foreman start
$ bundle exec rspec spec -f d
```

## How to create rails app using mongodb

create rails app
```
$ rails _3.2.21_ new rails-mongodb-playground --skip-active-record --skip-bundle
```

add mongoid in Gemfile
```
gem 'mongoid', '~>3.0.1'
```

create config
```
$ rails g mongoid:config
```

start mongodb
```
$ mongo: mongod --dbpath db/ --port 27017
```
