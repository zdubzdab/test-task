# frozen_string_literal: true

class CreateDivisionTeams < ActiveRecord::Migration[5.0]
  def change
    create_table(:division_teams) do |t|
      t.references(:team, foreign_key: true, null: false)
      t.references(:division, foreign_key: true, null: false)

      t.timestamps
    end
  end
end
