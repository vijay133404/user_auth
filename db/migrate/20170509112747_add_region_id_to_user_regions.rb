class AddRegionIdToUserRegions < ActiveRecord::Migration[5.0]
  def change
    add_column :user_regions, :region_id, :integer
  end
end
