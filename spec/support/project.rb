class Project
  include ActiveModel::Observing

  attr_accessor :state, :goal, :online_days, :online_date
end
