# TestrailApiClient

This is implimentation of client for testrail API.
It suports [TestRail API](https://www.gurock.com/testrail/docs/api/reference) but not all APIs yet.
You can check which APIs are supported on this [wiki](https://github.com/tamaki-shingo/testrail_api_client/wiki/Support-API).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'testrail_api_client', git: 'git@github.com:tamaki-shingo/testrail_api_client.git'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install testrail_api_client

⚠️ testrail_api_client isn't publish to ruby gems yet. It will be publish It will be publish in the future.

## Usage

```
url  = "https://example.testrail.com"
user = "your_user"
pass = "your_password"
client = TestRailApiClient::Client.new(url, user, pass)

# GET
projects = client.projects

# POST
project_id = 1
param = 
{
    "name": "Milestone sample",
    "description": "Hello Milestone"
}
client.add_milestone(project_id, param)
```

<!-- ## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org). -->

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tamaki-shingo/testrail_api_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/tamaki-shingo/testrail_api_client/blob/master/CODE_OF_CONDUCT.md).


## Code of Conduct

Everyone interacting in the TestrailApiClient project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tamaki-shingo/testrail_api_client/blob/master/CODE_OF_CONDUCT.md).


## Thanks
testrail_api_client inspired by [testrail_api](https://github.com/kirillzh/testrail_api).
that library alredy archived. so I made testrail_api_client to supports more APIs.