class User < ApplicationRecord

  def self.create_with_omniauth(auth)

    user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
    user.password = auth['uid']
    user.first_name = auth['info']['first_name']
    user.save!

    if User.exists?(user)
      user
    else
      user.save!
      user
    end
  end

end
