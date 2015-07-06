require 'active_record'
require_relative 'word'

class Element < ActiveRecord::Base
  belongs_to :word
end