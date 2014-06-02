module CatarseMonkeymail::ProjectConcern
  extend ActiveSupport::Concern

  included do
    def mailchimp
      @mailchimp ||= ::CatarseMonkeymail::MailchimpApi.start
    end

    def subscribe_owner_to_success_list
      subscribe_to_list monkey_settings.successful_projects_list
    end

    def subscribe_owner_to_failed_list
      subscribe_to_list monkey_settings.failed_projects_list
    end

    private

    def monkey_settings
      ::CatarseMonkeymail.configuration
    end

    def subscribe_to_list(list_id)
      mailchimp.lists.subscribe list_id, { email: self.user.email }, subscriber_args
    end

    def subscriber_args
      {
        fname: self.user.name,
        city: self.user.address_city,
        state: self.user.address_state
      }
    end

  end
end
