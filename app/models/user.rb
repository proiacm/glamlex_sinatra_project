class User < ActiveRecord::Base 
    has_many :appointments 
    has_secure_password
    validates_presence_of :username, :email, :password
    validates_uniqueness_of :username, :email, { case_sensitive: false }
end