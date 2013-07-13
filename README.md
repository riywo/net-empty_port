# Net::EmptyPort

[![Build Status](https://travis-ci.org/riywo/net-empty_port.png?branch=master)](https://travis-ci.org/riywo/net-empty_port)

This module can find, check and wait an empty TCP/UDP port.

## Installation

Add this line to your application's Gemfile:

    gem 'net-empty_port'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install net-empty_port

## Usage

    port = Net::EmptyPort.empty_port
    TCPServer.new('127.0.0.1', port)

    Net::EmptyPort.used?(port)

    Net::EmptyPort.wait(port, 3)

## Thanks

This module is originally in a perl module [`Test::TCP`](https://github.com/tokuhirom/Test-TCP) written by tokuhirom. Thanks a lot.

## See also

### [glint](https://github.com/kentaro/glint)
This module is similar, but only for starting a server process.

## TODO

- more test

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
