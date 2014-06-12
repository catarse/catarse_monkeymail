class User 
  def self.before_save
    yield
  end

  def self.newsletter_changed?
  end

  def self.newsletter
  end
end
