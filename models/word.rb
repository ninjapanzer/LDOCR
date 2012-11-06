require 'active_record'

class Word < ActiveRecord::Base
	attr_accessor :word
	belongs_to :type
end