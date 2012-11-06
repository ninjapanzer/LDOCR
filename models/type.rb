require 'active_record'

class Type < ActiveRecord::Base
	attr_accessor :type
	has_many :words
end