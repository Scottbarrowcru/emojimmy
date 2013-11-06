<p align="center">
  <a href="https://github.com/mirego/emojimmy">
    <img src="http://i.imgur.com/n4Dh6tB.png" alt="Emojimmy" />
  </a>
  <br />
  Emojimmy makes it possible to store emoji characters in ActiveRecord datastores<br/> that don’t support <em>4-Byte UTF-8 Unicode</em> (<code>utf8mb4</code>) encoding.
  <br /><br />
  <a href="https://rubygems.org/gems/emojimmy"><img src="https://badge.fury.io/rb/emojimmy.png" /></a>
  <a href="https://codeclimate.com/github/mirego/emojimmy"><img src="https://codeclimate.com/github/mirego/emojimmy.png" /></a>
  <a href='https://coveralls.io/r/mirego/emojimmy?branch=master'><img src='https://coveralls.io/repos/mirego/emojimmy/badge.png?branch=master' /></a>
  <a href='https://gemnasium.com/mirego/emojimmy'><img src="https://gemnasium.com/mirego/emojimmy.png" /></a>
  <a href="https://travis-ci.org/mirego/emojimmy"><img src="https://travis-ci.org/mirego/emojimmy.png?branch=master" /></a>
</p>

You probably should be using a database that supports `utf8mb4` though (and not this gem), like PostgreSQL or MySQL (5.5+). We built this gem because stock [Heroku](http://heroku.com) machines cannot compile the `mysql2` gem to use the `utf8mb4` encoding (because they ship with an old version of `libmysqlclient`).

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'emojimmy'
```

### Usage

#### ActiveRecord

You have to edit your models to specify which fields will be storing emoji characters:

```ruby
# app/models/comment.rb
class Comment < ActiveRecord::Base
  stores_emoji_characters :body
end
```

Your model will now be able to store emoji characters in its `body` column.

```ruby
# Create a comment with an emoji
@comment = Comment.create(body: "Hello! 😁")

# Our comment has been saved in the database
@comment.persisted? # => true

# Magic! Our body contains the emoji!
@comment.body # => "Hello! 😁"

# The real magic… how emoji are actually stored
@comment.read_attribute(:body) # => "Hello! :grin:"
```

#### Custom

If you only want to use Emojimmy’s conversion methods, you can use two methods, `token_to_emoji` and `emoji_to_token`:

```ruby
Emojimmy.emoji_to_token("Hello! 😁")
# => "Hello! :grin:"

Emojimmy.token_to_emoji("Hello! :grin:")
# => "Hello! 😁"
```

## License

`Emojimmy` is © 2013 [Mirego](http://www.mirego.com) and may be freely distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).  See the [`LICENSE.md`](https://github.com/mirego/emojimmy/blob/master/LICENSE.md) file.

## About Mirego

Mirego is a team of passionate people who believe that work is a place where you can innovate and have fun. We proudly build mobile applications for [iPhone](http://mirego.com/en/iphone-app-development/ "iPhone application development"), [iPad](http://mirego.com/en/ipad-app-development/ "iPad application development"), [Android](http://mirego.com/en/android-app-development/ "Android application development"), [Blackberry](http://mirego.com/en/blackberry-app-development/ "Blackberry application development"), [Windows Phone](http://mirego.com/en/windows-phone-app-development/ "Windows Phone application development") and [Windows 8](http://mirego.com/en/windows-8-app-development/ "Windows 8 application development") in beautiful Quebec City.

We also love [open-source software](http://open.mirego.com/) and we try to extract as much code as possible from our projects to give back to the community.
