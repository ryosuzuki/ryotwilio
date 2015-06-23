class User < ActiveRecord::Base
	validates :username, :password, :email, presence: true
	validates :username, uniqueness: true 
end
