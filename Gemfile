source "https://rubygems.org"

gemfile_url = File.join(File.dirname(__FILE__), 'spec/dummy/Gemfile')
gemfile_content = File.open(gemfile_url, "rb")  { |f| f.read }
eval_gemfile gemfile_url, gemfile_content.gsub(/(gem 'catarse_monkeymail'.+)/, '')

gemspec

