<h1 align="center">Runebook</h1>

<p align="center">
    <img src="https://raw.githubusercontent.com/reyes-dev/picture-dump/main/screenshot-20231011-041505Z-selected.png" />
</p>

<p align="center">
    Visit <a href="https://runebook.fly.dev">Runebook, a social media web app built with Ruby on Rails!</a>
</p>

## What is Runebook?
Runebook is a Ruby on Rails social media app built from scratch. Taking a [broad list of general specs](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project), I tackled them one by one, starting with setting up a simple PostgreSQL database, and moving forward to adding users, implementing the ability for those users to add friends, make posts, make comments, like posts/comments, and share pictures. I ended up with a really cool, fully-functional, tested and [deployed](https://runebook.fly.dev) website that demos like an early Facebook.

<img src="https://raw.githubusercontent.com/reyes-dev/picture-dump/main/runebook.fly.dev.png" />

## Why did I build Runebook?
My general motivation was that I wanted to gain experience building a web app with a full suite of features that you might find on a social media website like Facebook. To build up a complete website from scratch that lives on the web thanks to code I wrote was an exciting thought that motivated me throughout the process. I also wanted to understand the Ruby on Rails framework more thoroughly, and experience firsthand all of its powerful capabilities.

## Features
- Create User Accounts with Devise gem
- Custom profile images and descriptions
- Add friends and view in friendlist
- Timeline feed of recent posts
- Create posts/comments with images
- Like posts/comments
- Tested with RSpec

## How to use live site
*Log in with a seeded profile:*

acc: User_1@example.com <br />
pw: password

acc: User_2@example.com <br />
pw: password

acc: User_3@example.com <br />
pw: password

# Local installation
Follow the recipe below to run Runebook on your a fresh, local machine. If you're starting from scratch, you will need to download a handful of dependencies to get it working locally!
1. Install Ruby. For help with that, [here is a great resource on installing the latest version of Ruby.](https://www.theodinproject.com/lessons/ruby-installing-ruby)
2. Install Ruby on Rails. For help with that, I recommend [this great resource on installing Rails.](https://www.theodinproject.com/lessons/ruby-on-rails-installing-rails)
3. Finally, install PostgreSQL. If you need help, [here is a good resource on install PostgreSQL.](https://www.theodinproject.com/lessons/ruby-on-rails-installing-postgresql) You may need to [install node](https://www.theodinproject.com/lessons/foundations-installing-node-js) first.
4. Clone the repo, [instructions on how to do that here](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository). If you need help installing git, [try this resource on installing git.](https://www.theodinproject.com/lessons/foundations-setting-up-git)
5. Run the command `bundle install` to install all dependencies in the Gemfile.
6. Run the command `rake db:setup` to set up the PSQL database and seed it.
7. Run the command `rails server` to launch the local server.
8. Visit `localhost:3000` in your browser of choice.
9. Log in with the fake accounts listed in the above section or create a new one.
10. Play around with it!

# Tests
All tests are written in RSpec. Run in your terminal with
`bundle exec rspec`
