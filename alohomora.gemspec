$:.push File.expand_path("lib", __dir__)

# Maintain your gem"s version:
require "alohomora/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "alohomora"
  s.version     = Alohomora::VERSION
  s.authors     = ["Nicholas W. Watson"]
  s.email       = ["nicholas.w.watson@me.com"]
  s.homepage    = "https://github.com/nwwatson/alohomora"
  s.summary     = "Gem for accounts and authentication"
  s.description = "Alohomora (AL-o-ho-MOR-ah) is a Rails plugin for quickly getting up and running with accounts/authentication."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "guard", "2.14.2"
  s.add_development_dependency "guard-rails", "~> 0.8.1"
  s.add_development_dependency "guard-minitest"
  s.add_development_dependency "annotate", "~> 2.7", ">= 2.7.2"
end
