class RenameColumnAddDefaultValueToMegaMenuItems < ActiveRecord::Migration
  def up
    change_column :spree_mega_menu_items, :type_of_link, :string, :default => 'page'
  end
  def down
    change_column :spree_mega_menu_items, :type_of_link, :string, :default => nil
  end
end
