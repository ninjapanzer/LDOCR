load '../config/active_record_config.rb'
load '../models.rb'

ActiveRecord::Schema.define do
  create_table :types do |t|
    t.text :name
  end

  create_table :words do |t|
    t.text :word
    t.references :type, :polymorphic => true
    t.timestamps
  end
end

t = Type.create
t.name = 'n'
t.save

t = Type.create
t.name = 'r'
t.save

t = Type.create
t.name = 'a'
t.save

t = Type.create
t.name = 'v'
t.save