class User < ApplicationRecord
    has_many :gamestats
    validates :user_name, uniqueness: true
    has_secure_password 
end
