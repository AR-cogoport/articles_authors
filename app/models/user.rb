class User < ApplicationRecord
#  validates :email, presence: true, format: {with: /\A\S+@.+\.\S+\z/}, uniqueness: true;
     has_secure_password
end

