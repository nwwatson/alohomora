$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "alohomora/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "alohomora"
  s.version     = Alohomora::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Alohomora."
  s.description = "TODO: Description of Alohomora."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "bcrypt-ruby", "~> 3.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
