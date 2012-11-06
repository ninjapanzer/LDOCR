require 'active_record'

class Word < ActiveRecord::Base
	#attr_accessor :name
	belongs_to :type
end