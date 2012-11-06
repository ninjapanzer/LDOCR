load '../config/active_record_config.rb'

ActiveRecord::Schema.define do
  create_table :types do |t|
    t.text :name
    #t.references :word
  end

  create_table :words do |t|
    t.text :word
    #t.integer :type_id
    t.references :type
    t.timestamps
  end
end