class ModifyAdvertiserCountryField < ActiveRecord::Migration
  def up
    rename_column :advertisers, :country, :country_code
    rename_column :campaigns, :country, :country_code

    remove_column :campaigns, :in_pause
    add_column :campaigns, :in_pause, :boolean, null: false, default: false
  end

  def down
    change_column :campaigns, :in_pause, :string

    rename_column :campaigns, :country_code, :country
    rename_column :advertisers, :country_code, :country
  end
end
