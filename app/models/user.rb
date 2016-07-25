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
    user.total_reign ||= 0
    user.save!

    if User.exists?(user)
      user
    else
      user.save!
      user
    end
  end

  def update_total_reign(duration)
    actual_duration = self.total_reign += duration
    self.update_attribute(:total_reign, actual_duration)
  end

  def ranking
    ranking = User.where("total_reign > ?", total_reign).count
    ranking +=1
  end

  def title
    if self.gender == 'male'
      title = 'King'
    elsif self.gender == 'female' %
      title = 'Queen'
    else
      title = 'Monarch'
    end
    title
  end

end
