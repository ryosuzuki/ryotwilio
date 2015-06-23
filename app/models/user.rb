class User < ActiveRecord::Base
	validates :username, presence: true
	validates :username, uniqueness: true 
	has_secure_password
	validates_presence_of :password, :email, :on => :create
end
