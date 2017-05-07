class User < ActiveRecord::Base
    has_secure_password
    has_many :contents
    validates :email, uniqueness: true
    
    #validates_uniqueness_of :email
end
