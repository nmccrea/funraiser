require 'spec_helper'

describe Donation do
  
  describe 'associations' do
    
    it "should belong to a fundraiser" do
      donation = Donation.create
      donation.fundraiser = Fundraiser.create
      donation.save
      donation.reload
      donation.fundraiser.should_not be_nil
    end
  end
end
