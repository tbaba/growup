class User < ActiveRecord::Base
  has_many :projects
  has_many :comments
end
