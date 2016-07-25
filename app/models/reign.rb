class Reign < ApplicationRecord
  belongs_to :user
  has_one :length

  def self.transition(new_monarch_id)
    previous_reign = Reign.last
    previous_reign.finished = DateTime.now
    previous_reign.save
    length = Length.create(reign_id: previous_reign.id, secs: previous_reign.finished - previous_reign.created_at)
    length.save
    reign = Reign.create(user_id: new_monarch_id)
  end
end
