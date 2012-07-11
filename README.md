Alohomora
=========

Alohomora (AL-o-ho-MOR-ah) is an authentication gem based on warden that provides for the ability to manage users within organizations for Software As A Service applications. It also provides and OAuth2 server, which will enable you to allow third party applications to provide "single sign on" similar to Facebook or Twitter.

Installing Alohomora
--------------------

At this time, alohomora has not been be released to a gem repository because it is early in development. To install the development
build of the gem, add the following to your Gemfile.

    gem 'alohomora', :git => 'git@github.com:entropillc/alohomora.git'

Once added to your Gemfile, install through bundler

    bundle install
  
Alohomora requires the creation of a user model in your project to use for authentication. In order to ease this process an install generator will create the user model and corresponding migration. To run the installation scripts to install the migrations locally to your project

    rails g alohomora:install
    
Alohomora Implementation Details
---------

As mentioned in the install section, Alohomora creates a user model for your application to authenticate. All other models in the application are namespaced under "Alohomora", which should reduce the possibility of name collisions between models. If you wish to extend the underlying Alohomora models, it is suggested to create a decorator. For example, if you wish to extend the Alohomora::Organizations model to have a method called organization_administrator?  To do this add the following code to your application class in config/application.rb

    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end
    
Then create a file in your rails project:  app/models/alohomora/organization_decorator.rb

    # Use class_eval to add the new method to the class
    Alohomora::Organization.class_eval do
      
      # Add or overwrite methods within the class
      def organization_administrator?
        self.role_id.eql?(1) ? true : false
      end
            
    end