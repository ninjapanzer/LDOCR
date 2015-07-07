class Schema < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.string :part_of_speech
      t.text   :definition
      t.timestamps null: false
    end

    create_table :elements do |t|
      t.integer :word_id
      t.integer :sentence_position
      t.integer :document_position
      t.timestamps null: false
    end
  end
end
