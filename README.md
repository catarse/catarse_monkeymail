# CatarseMonkeymail

Mailchimp 2.0 integration for Catarse[http://github.com/catarse/catarse]


## Installation

Add into your Gemfile:

`gem 'catarse_monkeymail'`

or

`gem install catarse_monkeymail`


You need to have a Mailchimp API KEY and a List ID configured:

`CatarseSettings[:mailchimp_api_key] = 'YOUR_API_KEY'`

`CatarseSettings[:mailchimp_list_id] = 'YOUR_NEWSLETTER_LIST_ID'`


### If you want to use the project mailchimp integration (when project is failed or successful we add the project owner to a separated list) you need to:

#### Add into config/application.rb

`config.active_record.observers = 'CatarseMonkeyMail::MonkeyProjectObserver'`

#### Add theses configurations:

`CatarseSettings[:mailchimp_successful_projects_list] = 'YOUR_PROJECT_SUCCESSFUL_LIST_ID'`

`CatarseSettings[:mailchimp_failed_projects_list] = 'YOUR_PROJECT_FAILED_LIST_ID'`


This project rocks and uses MIT-LICENSE.
