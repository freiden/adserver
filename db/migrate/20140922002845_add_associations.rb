class AddAssociations < ActiveRecord::Migration
  def change
    add_column :advertisers, :user_id, :integer, null: false
    add_index :advertisers, :user_id

    add_column :campaigns, :advertiser_id, :integer, null: false
    add_index :campaigns, :advertiser_id
  end
end
