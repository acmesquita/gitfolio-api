class CreateRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :full_name
      t.string :owner
      t.string :html_url
      t.string :description
      t.datetime :start
      t.datetime :last_update
      t.datetime :last_pushed
      t.string :language
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
