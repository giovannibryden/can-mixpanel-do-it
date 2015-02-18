class Topic < ActiveRecord::Base
	validates_length_of :body, :within => 4..750
	validates :topic, uniqueness: {case_sensitive: false}, length: { maximum: 750 }
	has_many :comments, :dependent => :destroy
	has_many :tags, :dependent => :destroy
end
