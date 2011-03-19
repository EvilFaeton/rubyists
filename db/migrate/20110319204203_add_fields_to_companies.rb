class AddFieldsToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :city_id, :integer
    add_column :companies, :twitter, :string
    add_column :companies, :facebook, :string
    add_column :companies, :vkonatkte, :string
  end

  def self.down
    remove_column :companies, :vkonatkte
    remove_column :companies, :facebook
    remove_column :companies, :twitter
    remove_column :companies, :city_id
  end
end
