class Comment < ActiveRecord::Base
  belongs_to :topic
  # Regex to check for format of email.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :body
  validates_length_of :body, :within => 4..750
  validates_presence_of :email, length: {maximum: 50}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates_presence_of :name, length: {maximum: 16}
end
