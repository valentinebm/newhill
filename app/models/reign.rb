class Reign < ApplicationRecord
  belongs_to :user
  validates :weapon, :format => { with: /\A[a-zA-Z]+\z/ , :message => 'no special characters, only letters and numbers' }


  # scope :top_ten_by_reigns, -> { includes(:user).where.not(duration: nil).order(duration: :desc).limit(10) }

  # def self.transition(new_monarch_id)
  #   previous_reign = Reign.last
  #   previous_reign.finished = DateTime.now
  #   previous_reign.duration = previous_reign.finished - previous_reign.created_at
  #   previous_reign.save
  #
  #   User.find(previous_reign.user_id).update_total_reign(previous_reign.duration)
  #
  #   reign = Reign.create(user_id: new_monarch_id)
  # end

end
