class AddFieldToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :contact_sub, :string
  end
end
