module QuestionsHelper

	def cache_key_for_question_table
		("question_table/#{Question.maximum(:updated_at)}/")
	end
end
