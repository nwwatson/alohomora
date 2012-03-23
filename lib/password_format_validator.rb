class PasswordFormatValidator < ActiveModel::EachValidator  
  def validate_each(object, attribute, value)  
    unless value =~ /^(?=.*\d)(?=.*([a-z]|[A-Z])){8,40}$/
      object.errors[attribute] << (options[:message] || "must contain on number and one symbol")  
    end  
  end  
end
