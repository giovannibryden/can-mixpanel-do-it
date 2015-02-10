class Topic < ActiveRecord::Base
	validates_length_of :body, :within => 4..750
	validates_presence_of :topic, length: {maximum: 30}, uniqueness: {case_sensitive: false}
end
