class User < ActiveRecord::Base

  has_secure_password

  def to_s
    username
  end
end
