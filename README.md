# CatarseMonkeymail [![Code Climate](https://codeclimate.com/github/catarse/catarse_monkeymail.png)](https://codeclimate.com/github/catarse/catarse_monkeymail)

Mailchimp 2.0 integration for [Catarse](http://github.com/catarse/catarse)


## Installation

Add into your Gemfile:

`gem 'catarse_monkeymail'`

or

`gem install catarse_monkeymail`


#### Create a config/initializers/monkeymail.rb and put

~~~
  CatarseMonkeymail.configure do |config|
    config.api_key = 'YOUR_API_KEY'
    config.list_id = 'YOUR_NEWSLETTER_LIST_ID'
    config.successful_projects_list = 'YOUR_PROJECT_SUCCESSFUL_LIST_ID'
    config.failed_projects_list = 'YOUR_PROJECT_FAILED_LIST_ID'
  end
~~~


#### Add into config/application.rb

`config.active_record.observers = 'CatarseMonkeymail::MonkeyProjectObserver'`


This project rocks and uses MIT-LICENSE.
