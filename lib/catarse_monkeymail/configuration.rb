module CatarseMonkeymail
  class Configuration
    attr_accessor :settings

    def inititalizer
      @settings = ::CatarseSettings
    end
  end
end
