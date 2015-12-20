class Contact < ActiveRecord::Base
	validates_presence_of :name, :email, :question
	validates_length_of :name, maximum: 25
	validates_length_of :question, maximum: 1000
end
