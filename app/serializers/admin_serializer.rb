class AdminSerializer < ActiveModel::Serializer
  attributes :id, :password, :username, :email, :auth_token
end
