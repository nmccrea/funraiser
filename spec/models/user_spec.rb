require 'spec_helper'

describe User do
  describe 'associations' do
    it 'should have many fundraisers' do
      user = User.create!
      user.fundraisers << Fundraiser.create!
      user.fundraisers << Fundraiser.create!
      user.save!
      user.reload      
      user.fundraisers.count.should == 2
    end
  end
end
