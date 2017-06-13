*Redmine* version is `3.3.3`

# monitoring_of_changes_plugin

monitoring_of_changes_plugin is a plugin for Redmine that helps Redmine's users get notification not only with email but also with notification by POST-request to your service.

## Features

## Built With

* The Ruby language - version 2.3.1
* Ruby on Rails - version 4.2.7.1 

## Deployment

## Author

* [Yaroslav Liakh](https://github.com/yashka713)

Prerequisites
-------------
First of all, Your need to install [Redmine](http://www.redmine.org/projects/redmine/wiki/HowTos) before work with this plugin
Required software: `ruby`, `redmine v3.3.3` add `gem 'httparty', '0.14'` to Your `Gemfile`

Install
-----------------
```
git clone https://github.com/yashka713/monitoring_of_changes_plugin
move `monitoring_of_changes_plugin` into `plugins` folder main directory
bundle install
```

Launch
------------
```
bundle exec rails s
```
Navigate to [http://localhost:3000](http://localhost:3000)

login as `admin` and configure url for request with [http://localhost:3000/settings/plugin/monitoring_of_changes](http://localhost:3000/settings/plugin/monitoring_of_changes)

Test
-------------
`rubocop`
