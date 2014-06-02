# CatarseMonkeymail

Mailchimp 2.0 integration for [Catarse](http://github.com/catarse/catarse)


## Installation

Add into your Gemfile:

`gem 'catarse_monkeymail'`

or

`gem install catarse_monkeymail`


#### Create a config/initializers/monkeymail.rb and put

~~~
  CatarseMonkeymail.configure do |config|
    config.mailchimp_api_key = 'YOUR_API_KEY'
    config.mailchimp_list_id = 'YOUR_NEWSLETTER_LIST_ID'
    config.mailchimp_successful_projects_list = 'YOUR_PROJECT_SUCCESSFUL_LIST_ID'
    config.mailchimp_failed_projects_list = 'YOUR_PROJECT_FAILED_LIST_ID'
  end
~~~

by default we use the `::CatarseSettings` class


#### Add into config/application.rb

`config.active_record.observers = 'CatarseMonkeymail::MonkeyProjectObserver'`


This project rocks and uses MIT-LICENSE.
