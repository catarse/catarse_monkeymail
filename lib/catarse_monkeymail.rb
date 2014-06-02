require "catarse_monkeymail/engine"
require "catarse_monkeymail/configuration"

module CatarseMonkeymail
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
