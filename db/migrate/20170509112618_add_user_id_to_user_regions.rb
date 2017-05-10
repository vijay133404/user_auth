class AddUserIdToUserRegions < ActiveRecord::Migration[5.0]
  def change
    add_column :user_regions, :user_id, :integer
  end
end
