# frozen_string_literal: true

class CreateDivisions < ActiveRecord::Migration[5.0]
  def change
    create_table(:divisions) do |t|
      t.references(:tournament, foreign_key: true, null: false)

      t.timestamps
    end
  end
end
