class AddUserToAnswers < ActiveRecord::Migration
  def self.up
    change_table :answers do |t|
      t.references :user
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
