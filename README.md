# MongoDbStore
---------------

[![Gem Version](https://badge.fury.io/rb/mongo_db_store.svg)](https://badge.fury.io/rb/mongo_db_store)
[![Dependency Status](https://gemnasium.com/badges/github.com/qbantek/mongo_db_store.svg)](https://gemnasium.com/github.com/qbantek/mongo_db_store)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://mongo_db_store.mit-license.org)

Rails cache store for MongoDB using Mongoid. Compatible with Rails 5.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongo_db_store'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongo_db_store
    
## Usage    
    
```ruby
# config/application.rb
config.session_store :mongo_db_store
```

## Configuration

By default, the cache entries will be stored in the "rails_cache" collection 
and be expired in 1 day. To set different values:

```ruby
# config/application.rb
config.session_store :mongo_db_store, collection: 'foo', expires_in: 90.minutes
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec spec` to run the tests. 
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github
.com/qbantek/mongo_db_store. 
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere 
to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).