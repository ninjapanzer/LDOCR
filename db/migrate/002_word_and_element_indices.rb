class WordAndElementIndices < ActiveRecord::Migration
  def change
    add_index :words, [:word]
    add_index :words, [:part_of_speech]
    add_index :elements, [:sentence_position]
    add_index :elements, [:document_position]
  end
end