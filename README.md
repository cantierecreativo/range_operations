# RangeOperations

Perform operations on arrays of ranges.

# Installation

Add this line to your application's Gemfile:

```ruby
gem 'range_operations'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install range_operations
```

# Usage

This library offers 3 modules: Single, Pair and Array.

See [the documentation for details][range_operations_documentation].

[range_operations_documentation] https://??

# Notes

Currently, this library only handles `..` Ranges, i.e. Ranges that include
their endpoint.

# Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

# Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/cantierecreativo/range_operations. This project is intended
to be a safe, welcoming space for collaboration, and contributors are expected
to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of
conduct.

# License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
