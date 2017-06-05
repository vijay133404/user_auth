class AddCompanyIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :company_id, :integer
  end
end
