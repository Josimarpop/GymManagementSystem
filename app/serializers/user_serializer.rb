class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :status, :groups, :membership_types
end
