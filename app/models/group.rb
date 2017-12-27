class Group < ApplicationRecord
  has_many :users, through => :group_has_members
end
