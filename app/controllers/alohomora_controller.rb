class AlohomoraController < ActionController::Base
  
  # Sets the flash message with :key, using I18n. By default you are able
    # to setup your messages using specific resource scope, and if no one is
    # found we look to default scope.
    # Example (i18n locale file):
    #
    #   en:
    #     alohomora:
    #       passwords:
    #         #default_scope_messages - only if resource_scope is not found
    #         user:
    #           #resource_scope_messages
    #
    # Please refer to README or en.yml locale file to check what messages are
    # available.
    def set_flash_message(key, kind, options={})
      options[:scope] = "alohomora.#{controller_name}"
      options[:resource_name] = resource_name
      message = I18n.t("#{resource_name}.#{kind}", options)
      flash[key] = message if message.present?
    end
end

