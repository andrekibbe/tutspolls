class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :poll, index: true

      t.timestamps null: false
    end
    add_foreign_key :replies, :polls
  end
end
