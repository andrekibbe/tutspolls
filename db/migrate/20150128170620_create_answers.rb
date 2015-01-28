class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :reply, index: true
      t.references :question, index: true
      t.references :possible_answer, index: true
      t.string :value

      t.timestamps null: false
    end
    add_foreign_key :answers, :replies
    add_foreign_key :answers, :questions
    add_foreign_key :answers, :possible_answers
  end
end
