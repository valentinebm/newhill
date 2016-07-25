class Reign < ApplicationRecord
  belongs_to :user
  has_one :length

  def self.transition(new_monarch_id)
    previous_reign = Reign.last
    previous_reign.finished = DateTime.now
    previous_reign.save
    duration = previous_reign.finished - previous_reign.created_at
    length = Length.create(reign_id: previous_reign.id, seconds: duration)
    length.save
    reign = Reign.create(user_id: new_monarch_id)
  end
end
