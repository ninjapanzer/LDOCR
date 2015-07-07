class SentenceAndDocument < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.integer :document_id
      t.timestamps null: false
    end

    create_table :documents do |t|
      t.string :filename
      t.timestamps null: false
    end

    change_table :elements do |t|
      t.integer :sentence_id
      t.integer :document_id
    end
  end
end
