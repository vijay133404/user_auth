class AddNodeIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :node_id, :integer
  end
end
