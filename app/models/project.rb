class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :comments
end
