User = Struct.new(:newsletter, :email) do
  def self.before_save
    yield
  end

  def self.newsletter_changed?
  end

  def self.newsletter
  end

  def update_attributes(attributes={})
  end

  def save
  end
end
