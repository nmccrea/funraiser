require 'spec_helper'

describe Fundraiser do
  describe "associations" do
    it "should belong to an owner_user" do
      fundraiser = Fundraiser.create!
      fundraiser.owner_user = User.create!
      fundraiser.save!
      fundraiser.reload
      fundraiser.owner_user.should_not be_nil
    end
  end
end
