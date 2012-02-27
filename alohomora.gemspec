$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "alohomora/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "alohomora"
  s.version     = Alohomora::VERSION
  s.authors     = ["Nicholas W. Watson"]
  s.email       = ["nick@entropi.co"]
  s.homepage    = "http://github.com/entropillc/alohomora"
  s.summary     = "Gem that encapsulates the authentication logic and screens used in Entropi's SAAS applications"
  s.description = "Alohomora (AL-o-ho-MOR-ah) is an authentication gem based on warden that provides for the ability to manage users within organizations."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency "warden", "~> 1.1.1"
  s.add_dependency "bcrypt-ruby", "~> 3.0"


  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "guard-rspec"
end
