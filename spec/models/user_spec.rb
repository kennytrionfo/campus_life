require 'rails_helper'

RSpec.describe User, :type => :model do

    describe 'validations', :focus do
      it { should validate_presence_of :first_name }
      it { should validate_presence_of :last_name }
    end

    describe '#name', :focus do
      before do
        @user = create(:user, first_name: 'Bill', last_name: 'Rogers')
    end
    it 'returns Bill Rogers' do
      expect(@user.name).to eq 'Bill Rogers'
    end
  end

  describe '#age', :focus do
    before do
      @user = create(:user, birthday: '1990-01-01' )
    end
    it 'returns 24' do
      expect(@user.age).to eq 24
    end

  end


end
