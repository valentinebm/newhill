class User < ApplicationRecord
  has_many :reigns

  def self.create_with_omniauth(auth)

    user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
    user.password = auth['uid']
    user.first_name = auth['info']['first_name']
    user.last_name = auth['info']['last_name']
    user.age_range = auth.extra.raw_info.age_range
    user.link = auth.extra.raw_info.link
    user.picture = auth.extra.raw_info.picture
    user.locale = auth.extra.raw_info.locale
    user.gender = auth.extra.raw_info.gender
    user.save!

    if User.exists?(user)
      user
    else
      user.save!
      user
    end
  end

end
