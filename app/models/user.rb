#email:string
#password_digest:string
#
#password:string virtual
#password_confirmation:string virtual 




class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be invalid email" }
  
  has_many :gossips
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
