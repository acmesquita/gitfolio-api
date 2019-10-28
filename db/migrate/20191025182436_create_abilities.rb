class CreateAbilities < ActiveRecord::Migration[6.0]
  def change
    create_table :abilities do |t|
      t.string :kind
      t.string :description
      t.string :language, unique: true
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
