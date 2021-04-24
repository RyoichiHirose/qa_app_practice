class AddQuestionIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers,:question,index: true
  end
  
  def down
    remove_reference :answers,:question,index: true
  end
end
