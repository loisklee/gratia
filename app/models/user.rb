class User < ActiveRecord::Base
    has_secure_password

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    
    has_many :entries
end
