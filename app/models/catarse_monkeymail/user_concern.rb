module CatarseMonkeymail::UserConcern
  extend ActiveSupport::Concern

  included do
    before_save do
      if self.newsletter_changed? && self.newsletter
        subscribe_to_newsletter_list
      end

      if self.newsletter && self.email_changed? && !self.new_record?
        unsubscribe_from_newsletter_list self.email_was
        subscribe_to_newsletter_list
      end

      if self.newsletter_changed? && !self.newsletter
        unsubscribe_from_newsletter_list
      end
    end

    def mailchimp
      @mailchimp ||= ::CatarseMonkeymail::MailchimpApi.start
    end

    def subscribe_to_newsletter_list
      mailchimp.lists.subscribe(monkey_settings.list_id, { email: self.email }, { name: self.name }, 'html', false) rescue nil
    end

    def unsubscribe_from_newsletter_list email_arg = self.email
      mailchimp.lists.unsubscribe(monkey_settings.list_id, { email: email_arg }) rescue nil
    end

    private

    def monkey_settings
      ::CatarseMonkeymail.configuration
    end

  end
end
