class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title,limit: 50,null: false
      t.text :content,limit: 1000

      t.timestamps
    end
  end
end
