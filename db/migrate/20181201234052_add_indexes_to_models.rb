class AddIndexesToModels < ActiveRecord::Migration[5.2]
  def change
  	 add_index :questions, :user_id
	 add_index :articles, :question_id
	 add_index :comments, :user_id
  end
end
