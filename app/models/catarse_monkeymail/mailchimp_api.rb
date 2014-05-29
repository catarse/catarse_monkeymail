require 'mailchimp'

module CatarseMonkeymail
  class MailchimpApi
    def self.start
      @mailchimp ||= ::Mailchimp::API.new(::CatarseSettings[:mailchimp_api_key])
    end
  end
end
