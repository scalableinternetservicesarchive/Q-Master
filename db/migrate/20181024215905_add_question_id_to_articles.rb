class AddQuestionIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :question_id, :integer
  end
end
