class Topic < ActiveRecord::Base
	validates_length_of :body, :within => 4..750
	validates_length_of :topic, :within => 4..30
	validates_presence_of :topic, uniqueness: {case_sensitive: false}
end
