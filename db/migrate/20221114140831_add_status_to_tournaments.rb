# frozen_string_literal: true

class AddStatusToTournaments < ActiveRecord::Migration[5.0]
  def up
    execute(<<-SQL.squish)
      ALTER TABLE tournaments ADD status enum("draft", "in_progress", "done") default "draft";
    SQL
  end

  def down
    remove_column(:tournaments, :status)
  end
end
