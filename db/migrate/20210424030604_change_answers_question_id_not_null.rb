class ChangeAnswersQuestionIdNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :answers,:question_id,:integer,null: false
  end
end
