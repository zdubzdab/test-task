# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table(:games) do |t|
      t.references(:tournament, foreign_key: true, null: false)

      t.timestamps
    end
  end
end
