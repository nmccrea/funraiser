class AddFundraiserNameToFundraiser < ActiveRecord::Migration
  def change
    add_column :fundraisers, :fundraiser_name, :string
  end
end
