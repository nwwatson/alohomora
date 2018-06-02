module Alohomora
  module Concerns
    module Slugable
      extend ActiveSupport::Concern

      included do
        before_validation :make_slug, on: :create
        scope :find_by_slug, ->(slug) { find_by(slug: slug) }
      end

      module ClassMethods
        def sluggable_field(field)
          code = %Q{
            def make_slug
              #strip the string
              ret = self.#{field}.strip
              #blow away apostrophes
              ret.gsub! /['`]/,""
              # @ --> at, and & --> and
              ret.gsub!(/\s*@\s*/, " at ")
              ret.gsub!(/\s*&\s*/, " and ")
              #replace all non alphanumeric, underscore or periods with underscore
              ret.gsub!(/\s*[^A-Za-z0-9\.\-]\s*/, '-')
              #convert double underscores to single
              ret.gsub!(/_+/,"_")
              #strip off leading/trailing underscore
              ret.gsub!(/\A[_\.]+|[_\.]+\z/,"")
              self.slug = ret.downcase
            end
          }
          class_eval(code)
        end
      end

      def to_param
        self.slug
      end

    end
  end
end
