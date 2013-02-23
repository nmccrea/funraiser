class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :recipient_fundraiser_id
      t.float :amount
      t.string :donor_first_name
      t.string :donor_last_name
      t.string :donor_organization
      t.text :donor_message
      t.timestamps
    end
  end
end
