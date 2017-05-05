class CreateUserRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_regions do |t|
      t.string :region_name

      t.timestamps
    end
  end
end
