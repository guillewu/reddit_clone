class RemoveSubIdFromLinksTable < ActiveRecord::Migration
  def up
    remove_column :links, :sub_id
  end

  def down
    add_column :links, :sub_id, :integer
    add_index :links, :sub_id
  end
end
