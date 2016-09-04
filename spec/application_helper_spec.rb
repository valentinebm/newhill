describe ApplicationHelper, type: :helper do
  let!(:users) { Fabricate.times(15, :user) }

  before (:each) do
    users.each do |user|
      reign_count = [1, 2, 3].sample
      duration = [1, 2, 3, 4, 5].sample

      Fabricate.times(reign_count, :reign, user: user, duration: duration, finished: Time.now)
      user.update_total_reign
    end
  end

  describe 'top ten by reign number' do
    it 'returns the top 10 users ordered by number of reigns' do
      top_ten = helper.top_ten_by_reign_number
      expect(top_ten.length).to eq 10

      previous_count = 1000

      top_ten.each do |u|
        expect(u.reigns_count > 0).to be true
        expect(previous_count >= u.reigns_count).to be true
        expect(u.first_name.present?).to be true
        expect(u.respond_to? 'gender').to be true
        expect(u.respond_to? 'picture').to be true

        previous_count = u.reigns_count
      end
    end
  end

  describe 'top ten by duration' do
    it 'returns the top 10 users ordered by total reign duration' do
      top_ten = helper.top_ten_by_duration
      expect(top_ten.length).to eq 10

      previous_duration = 1000

      top_ten.each do |u|
        expect(previous_duration >= u.total_reign).to be true
        previous_duration = u.total_reign
      end
    end
  end

end
