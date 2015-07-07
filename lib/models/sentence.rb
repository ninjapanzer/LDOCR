require 'active_record'
require_relative 'word'
require_relative 'document'

class Sentence < ActiveRecord::Base
  has_many :element, :dependent => :destroy
  belongs_to :document
end
