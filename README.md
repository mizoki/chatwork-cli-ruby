# Chatwork CLI for ruby

This script is to use the chatwork from the command line.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chatwork_cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chatwork_cli

## Usage

    $ export CHATWORK_API_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    $ chatwork-cli check-update
    $ chatwork-cli get-messages

## Development

Run locally to check.

    $ ruby -Ilib ./bin/chatwork-cli

Install locally.

    $ rake install

## Contributing

1. Fork it ( https://github.com/[my-github-username]/chatwork_cli/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
