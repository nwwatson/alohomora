class PasswordFormatValidator < ActiveModel::EachValidator  
  def validate_each(object, attribute, value)  
    unless value =~ /^({8,50})$/i  
      object.errors[attribute] << (options[:message] || "is not formatted properly")  
    end
  end  
end
