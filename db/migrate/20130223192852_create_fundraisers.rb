class CreateFundraisers < ActiveRecord::Migration
  def change
    create_table :fundraisers do |t|
      t.integer :owner_user_id
      t.float :fundraising_goal
      t.float :funds_raised
      t.integer :status
      t.timestamps
    end
  end
end
