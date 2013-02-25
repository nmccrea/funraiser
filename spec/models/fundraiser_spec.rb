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
    
    it 'should have a value of 0 for the initial funds_raised' do
      Fundraiser.new.funds_raised.should == 0;
    end
    
    it 'should NOT have the funds_raised value reset to 0 when loading from the database' do
      fundraiser = Fundraiser.new
      fundraiser.funds_raised = 123.45
      fundraiser.save!
      fundraiser.reload
      fundraiser.funds_raised.should == 123.45
    end
  end
  
  describe 'public methods' do
    
    describe 'percent_of_goal_raised' do
      
      it 'should return the percentage of the goal raised, rounded to the nearest percent' do
        fundraiser = Fundraiser.new( :fundraising_goal => 100.0 )
        donation = Donation.new( :amount => 24.3 )
        fundraiser.receive_donation( donation )
        fundraiser.percent_of_goal_raised.should == 24
      end
    end # describe 'percent_of_goal_raised' do
    
    describe 'receive_donation' do
      
      it 'should add the donation amount to the total raised' do
        fundraiser = Fundraiser.new
        fundraiser.funds_raised.should == 0;
        donation1 = Donation.new( amount: 100 )
        expect{
          fundraiser.receive_donation( donation1 )
        }.to change{ fundraiser.funds_raised }.by( 100 )
        
        donation2 = Donation.new( amount: 13.75 )
        expect{
          fundraiser.receive_donation( donation2 )
        }.to change{ fundraiser.funds_raised }.by( 13.75 )
        
        fundraiser.funds_raised.should == 113.75
      end
      
      it 'should add the donation to donations array' do
        fundraiser = Fundraiser.new
        fundraiser.donations.should be_empty
        
        donation1 = Donation.new( :amount => 100.0 )
        donation2 = Donation.new( :amount => 13.75 )
        
        fundraiser.receive_donation( donation1 )
        fundraiser.donations.length.should == 1
        fundraiser.donations.first.should == donation1
        
        fundraiser.receive_donation( donation2 )
        fundraiser.donations.length.should == 2
        fundraiser.donations.last.should == donation2
      end
      
      # it 'should save the changes to the database' do
      #   
      # end
    end # describe 'receive_donation' do
  end
end
