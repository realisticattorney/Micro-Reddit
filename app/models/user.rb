class User < ApplicationRecord
   has_many :posts
   has_many :comments through :posts

   validates :name, presence: true
end
