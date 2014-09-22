class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.integer :budget, null: false, default: 0
      t.datetime :start_date
      t.datetime :end_date
      t.string :in_pause
      t.string :link
      t.string :country
      t.string :creative


      t.timestamps
    end
  end
end
