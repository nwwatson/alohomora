require 'jwt'

class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, Configuration.environment[:secret_key_base], "HS256")
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Configuration.environment[:secret_key_base], true, { algorithm: 'HS256' })[0])
  rescue
    nil
  end
end
