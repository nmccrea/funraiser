require 'spec_helper'

describe Fundraiser do
  
  describe "associations" do
    
    it "should belong to an owner_user" do
      fundraiser = Fundraiser.create
      fundraiser.owner_user = User.create
      fundraiser.save
      fundraiser.reload
      fundraiser.owner_user.should_not be_nil
    end
    
    it 'should have many donations' do
      fundraiser = Fundraiser.create
      fundraiser.donations << Donation.create
      fundraiser.donations << Donation.create
      fundraiser.save
      fundraiser.reload      
      fundraiser.donations.count.should == 2
    end
  end
  
  describe 'initialization' do
    it 'should have a value of zero for the initial funds raised' do
      Fundraiser.new.funds_raised.should == 0;
    end
  end
  
  describe 'public methods' do
    
    # describe 'recieve_donation' do
    #   
    #   it 'should add the donation amount to the total raised' do
    #     fundraiser = Fundraiser.create
    #     fundraiser.funds_raised.should == 0;
    #     donation1 = Donation.create( amount: 1200.50 )
    #     expect{
    #       fundraiser.recieve_donation( donation1 )
    #     }.to change{ fundraiser.funds_raised }.by( 1200.50 )
    #     
    #     donation2 = Donation.create( amount: 13.75 )
    #     expect{
    #       fundraiser.recieve_donation( donation2 )
    #     }.to change{ fundraiser.funds_raised }.by( 13.75 )
    #     
    #     fundraiser.funds_raised.should == 1214.25
    #   end
    #   
    #   it 'should add the donation to donations array' do
    #     
    #   end
    #   
    #   it 'should save the changes to the database' do
    #     
    #   end
    # end
  end
end
