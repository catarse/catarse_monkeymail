module CatarseMonkeymail::ControllerConcerns
  extend ActiveSupport::Concern

  included do
    def mailchimp
      @mailchimp ||= MailchimpApi.start
    end
  end
end
