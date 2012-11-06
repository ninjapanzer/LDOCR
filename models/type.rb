require 'active_record'

class Type < ActiveRecord::Base
	#attr_accessor :name
	has_many :words
end