module CatarseMonkeymail
  class MonkeyProjectObserver < ActiveRecord::Observer
    observe :project

    def from_online_to_successful(project)
      project.subscribe_owner_to_success_list
    end
    alias :from_waiting_funds_to_successful :from_online_to_successful

    def from_online_to_failed(project)
      project.subscribe_owner_to_failed_list
    end
    alias :from_waiting_funds_to_failed :from_online_to_failed
  end
end
