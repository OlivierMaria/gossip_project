class CreateGossips < ActiveRecord::Migration[7.0]
  def change
    create_table :gossips do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
