class RemoveTitleFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :title, :string
  end
end
