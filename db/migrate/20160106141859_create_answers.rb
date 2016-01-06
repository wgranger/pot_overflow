class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.boolean :best, default: false
      t.string :content
      t.references :question
      t.references :author

      t.timestamps null: false
    end
  end
end
