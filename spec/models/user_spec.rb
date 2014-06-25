require 'rails_helper'

RSpec.describe User, :type => :model do

    describe 'validations' do
      it { should validate_presence_of :first_name }
      it { should validate_presence_of :last_name }
    end

    describe '#name' do
      before do
        @user = create(:user, first_name: 'Bill', last_name: 'Rogers')
      end
      it 'returns Bill Rogers' do
        expect(@user.name).to eq 'Bill Rogers'
      end
    end

    describe '#age'  do
      before do
        Timecop.freeze(Time.local(2014))
        @user = create(:user, birthday: '1990-01-01' )
      end
      after do
        Timecop.return
      end
      it 'returns 24' do
        expect(@user.age).to eq 24
      end
    end

    describe '#inactive?', :focus do
      before do
        @user = create(:user, active: false)
      end
      it 'returns true for when active is false' do
        expect(@user).to be_inactive
      end

    end

end
