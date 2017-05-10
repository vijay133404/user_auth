class AddCountryIdToStates < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :country_id, :integer
  end
end
