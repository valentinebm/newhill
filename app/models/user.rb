class User < ApplicationRecord
  has_many :reigns

  def self.create_with_omniauth(auth)
    user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
    user.password = auth['uid']
    user.first_name = auth['info']['first_name']
    user.last_name = auth['info']['last_name']
    user.email = auth['info']['email']
    user.age_range = auth.extra.raw_info.age_range
    user.link = auth.extra.raw_info.link
    picture = auth['info']['image']
    user.picture = picture.slice(0..(picture.index('?')))+"width=200&height=200"
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

  def update_total_reign
    actual_duration = Reign.where(user_id: id).sum { |r| r.duration.present? ? r.duration : 0 }
    update_attribute(:total_reign, actual_duration)
  end

  def ranking_by_duration
    User.where("total_reign > ?", total_reign).count + 1
  end

  def ranking_by_reign_number
    users = User.joins(:reigns).group(:id).order("count(*) desc")
    users.each_with_index do |user, index|
      if user.id == id
        return index + 1
      end
    end
  end

  def title
    return 'Monarch' unless ['male', 'female'].include? gender
    gender == 'male' ? 'King' : 'Queen'
  end
end
