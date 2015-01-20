# drunken_parrot_flat_ui-rails

[![Drunken Parrot](https://static-2.gumroad.com/res/gumroad/files/f45b55aacb5446398504acf6379c2b76/original/gumroad-drunken-parrot-cover.png)](https://hoarrd.com/)

Drunken Parrot UI Kit - A retina-ready flat UI kit which includes a PSD, a Bootstrap-based responsive HTML, a beautiful icon font, and more!

This gem integrates Drunken Parrot UI Kit into Rails 3 and 4 Asset Pipeline.

> In order to install Drunken Parrot UI Kit into your rails app, You must purchase and download a licensed copy. This gem didn't include any license files and it just only contain the scripts to copy your licensed files from your local hard drive into this gem.

## Installation

First install and configure dependencies: [less-rails-bootstrap](https://github.com/metaskills/less-rails-bootstrap)

Add this line to your application's Gemfile:

```ruby
gem 'drunken_parrot_flat_ui-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install drunken_parrot_flat_ui-rails
    
## Copy Licensed Files

Make sure you already have Drunken Parrot UI Kit licensed files from your local harddrive, then go to your rails root folder and run

```ruby
rails generate drunken:install <Licensed Drunken Parrot Flat UI directory>
e.g.
rails generate drunken:install ~/Dropbox/Drunken/
```

## Install Demo Page

After you copy licensed files, you can install demo pages to view Drunken Parrot UI Kit usage

```ruby
rails generate drunken:demo
```
It will install the `drunkenparrotflatui_demo_controller` and 3 three views include `index`, `documentation` and `start_here`.

You visit it via

```ruby
http://0.0.0.0:3000/drunkenparrotflatui_demo_controller/index
http://0.0.0.0:3000/drunkenparrotflatui_demo_controller/documentation
http://0.0.0.0:3000/drunkenparrotflatui_demo_controller/start_here
```

## Basic CSS Usage

Get the full Drunken Parrot UI Kit stylesheet with a single line in your application.css.

```
/*
 *= require drunken-parrot/drunken-parrot
 */
```

## Basic JS Usage

Get the full Drunken Parrot UI Kit javascript with a single line in your application.js.

```
//= require drunken-parrot/drunken-parrot
```

## Advanced JS Usage

Include plugins individually. 

```
//= require drunken-parrot/html5shiv.js
//= require drunken-parrot/checkbox.js
//= require drunken-parrot/radio.js
//= require drunken-parrot/bootstrap-switch.js
//= require drunken-parrot/toolbar.js
//= require drunken-parrot/classie.js
//= require drunken-parrot/application.js
```

## Contributing

1. Fork it ( https://github.com/timshingyu/drunken_parrot_flat_ui-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credit

Drunken Parrot UI Kits is created by Riki Tanone & Paul Kinzett. You can purchase the premium version from https://hoarrd.com