class AddUserIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers,:user,index: true
  end
  
  def down
    remove_reference :answers,:user,index: true
  end

end
