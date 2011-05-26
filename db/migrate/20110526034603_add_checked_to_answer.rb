class AddCheckedToAnswer < ActiveRecord::Migration
  def self.up
    add_column :answers, :checked, :boolean, :default => false
  end

  def self.down
    remove_column :answers, :checked
  end
end
