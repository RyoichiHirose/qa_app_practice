class AddSolvedToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions,:solved,:boolean,default:false,null:false
  end
end
