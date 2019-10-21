class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :login
      t.string :avatar_url
      t.string :name
      t.string :location
      t.string :email
      t.string :bio
      t.datetime :start
      t.datetime :last_update

      t.timestamps
    end
  end
end
