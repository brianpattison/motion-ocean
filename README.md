# MotionOcean

[![Build Status](https://travis-ci.org/brianpattison/motion-ocean.svg?branch=master)](https://travis-ci.org/brianpattison/motion-ocean)
[![Code Climate](https://codeclimate.com/github/brianpattison/motion-ocean.png)](https://codeclimate.com/github/brianpattison/motion-ocean)

MotionOcean is a [RubyMotion](ht) wrapper for the
[DigitalOcean API v2.0](https://developers.digitalocean.com/v2/).

Just a starting point so far, but everything available via the
[DigitalOcean API v2.0](https://developers.digitalocean.com/v2/)
will soon be available through this library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "motion-ocean", github: "brianpattison/motion-ocean"
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install motion-ocean
```

## Configuration

The only configuration needed is to set your DigitalOcean API Token.
You can generate a new token in the
[Apps & API](https://cloud.digitalocean.com/settings/applications)
section of your DigitalOcean control panel.

```ruby
MotionOcean.token = "9f786ce417aaa0d96e8ce4144b43058b75a585a6b56a8f72368589be667f5ee5"
```

## Usage

Real docs coming soon, but basically something like this:

```ruby
# Retrieve all droplets
MotionOcean::Droplet.all do |droplets, error|
  if droplets
    # Success!
  elsif error
    # Doh!
  end
end

# Retrieve a droplet by ID
MotionOcean::Droplet.find(123) do |droplet, error|
  if droplet
    # Success!
  elsif error
    # Doh!
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
