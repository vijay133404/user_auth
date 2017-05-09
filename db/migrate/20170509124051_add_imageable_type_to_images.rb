class AddImageableTypeToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :imageable_type, :string
  end
end
