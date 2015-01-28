class CreatePossibleAnswers < ActiveRecord::Migration
  def change
    create_table :possible_answers do |t|
      t.references :question, index: true
      t.string :title

      t.timestamps null: false
    end
    add_foreign_key :possible_answers, :questions
  end
end
