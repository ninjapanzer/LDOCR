require 'active_record'
require_relative 'sentence'

class Document < ActiveRecord::Base
  has_many :element, :dependent => :destroy
  has_many :sentence, :dependent => :destroy
end
