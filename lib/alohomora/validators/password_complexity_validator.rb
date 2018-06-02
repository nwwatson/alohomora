module Alohomora
  module Validators
    class PasswordComplexityValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        unless value =~ /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+/
          record.errors[attribute] << (options[:message] || "must include at least one lowercase letter, one uppercase letter, and one digit")
        end
      end
    end
  end
end
