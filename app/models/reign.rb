class Reign < ApplicationRecord
  belongs_to :user

  def self.transition(new_monarch_id)
    previous_reign = Reign.last
    previous_reign.finished = DateTime.now
    previous_reign.save
    reign = Reign.create(user_id: new_monarch_id)
  end

end
