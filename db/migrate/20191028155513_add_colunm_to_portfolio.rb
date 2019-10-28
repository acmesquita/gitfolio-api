class AddColunmToPortfolio < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :html_url, :string
  end
end
