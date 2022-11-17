class AddCategoryToPlayoffs < ActiveRecord::Migration[5.0]
  def up
    execute(<<-SQL.squish)
      ALTER TABLE playoffs ADD category ENUM('A', 'B') NOT NULL;
    SQL
  end

  def down
    remove_column(:playoffs, :category)
  end
end
