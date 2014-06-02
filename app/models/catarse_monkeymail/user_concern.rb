module CatarseMonkeymail::UserConcern
  extend ActiveSupport::Concern

  included do

    before_save do
      if self.newsletter_changed? && self.newsletter
        return subscribe_to_newsletter_list
      end

      if self.newsletter && self.email_changed? && !self.new_record?
        unsubscribe_from_newsletter_list self.email_was
        return subscribe_to_newsletter_list
      end

      if self.newsletter_changed? && !self.newsletter
        return unsubscribe_from_newsletter_list
      end
    end

    def mailchimp
      @mailchimp ||= ::CatarseMonkeymail::MailchimpApi.start
    end

    def subscribe_to_newsletter_list
      mailchimp.lists.subscribe monkey_settings.list_id, { email: self.email }, { name: self.name }
    end

    def unsubscribe_from_newsletter_list email_arg = self.email
      mailchimp.lists.unsubscribe monkey_settings.list_id, { email: email_arg }
    end

    private

    def monkey_settings
      ::CatarseMonkeymail.configuration
    end

  end
end
