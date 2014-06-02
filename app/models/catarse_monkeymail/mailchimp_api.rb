require 'mailchimp'

module CatarseMonkeymail
  class MailchimpApi
    def self.start
      @mailchimp ||= ::Mailchimp::API.new(::CatarseMonkeymail.configuration.settings[:mailchimp_api_key])
    end
  end
end
