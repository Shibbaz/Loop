class User < ApplicationRecord
    has_secure_password
  
    validates :name, presence: true
    validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
end