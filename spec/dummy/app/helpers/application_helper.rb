module ApplicationHelper
  def error_messages_for(*objects)
    options = objects.extract_options!
    options[:header_message] ||= I18n.t(:"activerecord.errors.header", :default => "Invalid Fields")
    options[:message] ||= I18n.t(:"activerecord.errors.message", :default => "Correct the following errors and try again.")
    messages = objects.compact.map { |o| o.errors.full_messages }.flatten
    unless messages.empty?
        # forced as error but may not abstractly always be the case
      content_tag(:div, :class => "alert alert-block alert-error") do
        list_items = messages.map { |msg| content_tag(:li, msg.html_safe) }
        content_tag(:h4, options[:header_message].html_safe, :class => "alert-heading") + content_tag(:p, options[:message].html_safe) + content_tag(:ul, list_items.join.html_safe)
      end
    end
  end
end
