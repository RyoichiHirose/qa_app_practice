class ChangeAnswersUserIdNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :answers,:user_id,:integer,null: false
  end
end
