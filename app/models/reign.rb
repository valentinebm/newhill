class Reign < ApplicationRecord
  belongs_to :user

  def self.transition(new_monarch_id)
    previous_reign = Reign.last
    previous_reign.finished = Time.now
    previous_reign.duration = (previous_reign.finished - previous_reign.created_at)
    previous_reign.save
    reign = Reign.create(user_id: new_monarch_id)
  end
end
