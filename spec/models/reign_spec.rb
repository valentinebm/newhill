describe Reign do
  describe 'validations' do
    let(:user) { Fabricate(:user) }
    let(:reign) { Fabricate(:reign, user: user) }

    describe 'weapon name' do
      it 'is invalid with special characters' do
        reign.weapon = '$word'
        expect(reign.valid?).to be false
      end

      it 'is valid with no special characters' do
        reign.weapon = 'axe'
        expect(reign.valid?).to be true
      end
    end
  end
end
