# frozen_string_literal: true

class AddCategoryToDivisions < ActiveRecord::Migration[5.0]
  def up
    execute(<<-SQL.squish)
      ALTER TABLE divisions ADD category ENUM('A', 'B') NOT NULL;
    SQL
  end

  def down
    remove_column(:divisions, :category)
  end
end
