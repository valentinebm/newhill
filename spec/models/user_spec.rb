describe User do
  let!(:user) { Fabricate(:user) }

  describe 'title' do
    it 'is King for male users' do
      user.update_attribute(:gender, 'male')
      expect(user.title).to eq 'King'
    end

    it 'is Queen for female users' do
      user.update_attribute(:gender, 'female')
      expect(user.title).to eq 'Queen'
    end

    it 'is Monarch for other users' do
      expect(user.title).to eq 'Monarch'
    end
  end

  describe 'ranking_by_reign_number' do
    let!(:user2) { Fabricate(:user) }
    let!(:reign1) { Fabricate.times(2, :reign, user: user) }
    let!(:reign2) { Fabricate(:reign, user: user2) }

    it 'returns the user rank by number of reigns' do
      expect(user.ranking_by_reign_number).to eq 1
      expect(user2.ranking_by_reign_number).to eq 2
    end
  end

  describe 'ranking_by_duration' do
    let!(:user2) { Fabricate(:user, total_reign: 200) }

    before (:each) do
      user.update_attribute(:total_reign, 100)
    end

    it 'returns the user ranking by duration' do
      expect(user.ranking_by_duration).to eq 2
      expect(user2.ranking_by_duration).to eq 1
    end
  end

  describe 'update_total_reign' do
    let!(:reign1) { Fabricate.times(2, :reign, user: user, duration: 100) }

    it 'sums up duration of all reigns and saves to user' do
      user.update_total_reign
      user.reload

      expect(user.total_reign).to eq 200
    end
  end
end
