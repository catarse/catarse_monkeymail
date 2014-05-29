$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "catarse_monkeymail/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "catarse_monkeymail"
  s.version     = CatarseMonkeymail::VERSION
  s.authors     = ["Antônio Roberto Silva"]
  s.email       = ["ton@catarse.me"]
  s.homepage    = "http://catarse.me"
  s.summary     = "Integration with the best newsletter services <3"
  s.description = "A new catarse integration with mailchimp"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_dependency "rails", "~> 4.0.3"
  s.add_dependency "mailchimp-api", "~> 2.0.4"

  s.add_development_dependency "sqlite3"
end
