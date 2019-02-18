# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :status
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end
