# RakeTaskExample

The RakeTaskExample gem is an example of how to create Rake tasks using [Rake](https://github.com/ruby/rake)'s `Rake::TaskLib` and how to use plain Rake syntax to do predefined tasks. I read a lot of the Rake, Bundler and some other examples as well as some blogs linked below. This isn't going to be a very useful RubyGem, but more of an informative one.

## Installation

This RubyGem will not be releaed to [RubyGems.org](https://rubygems.org) just because it doesn't do anything useful. So that being said the RubyGem needs to be installed a little differently than others.

In your Gemfile,
```ruby
gem 'rake_task_example', git: 'https://github.com/predatorian3/rake_task_example'
```

Then use `bundler` to install the dependencies.
```bash
bundle install
```

## Usage

The `rake_task_example` RubyGem is to be used in Rakefiles as a library to add functionality wihtout cluttering up the Rakefile or adding a ton of file to a [`rakelib`](https://ruby.github.io/rake/doc/rakefile_rdoc.html#label-Rakefile+Path) folder. This will then allow you to use the Ruby DSL portion of the gem, or the plain Rake tasks.

```ruby
# Rakefile.rb
require 'rake_task_example/examples01'
RakeTaskExample::Example01.new

require 'rake_task_example/examples02'

require 'rake_task_example/examples03'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/predatorian3/rake_task_example. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RakeTaskExample project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/predatorian3/rake_task_example/blob/master/CODE_OF_CONDUCT.md).

## References

* [Ruby Rake GitHub](https://github.com/ruby/rake)
* [Rake RDoc](https://ruby.github.io/rake)
* [Los Techies: How a .NET developer hacked out a Rake task](https://lostechies.com/derickbailey/2009/09/17/how-a-net-developer-hacked-out-a-rake-task/)
* [Los Techies: An alternate way to handle task dependencies in custom rake tasks](https://lostechies.com/derickbailey/2009/09/18/an-alternate-way-to-handle-task-dependencies-in-custom-rake-tasks/)

