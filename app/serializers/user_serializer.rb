class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :status, :sex, :address, :birth_date,
             :membership_starts_at, :membership_ends_at, :membership_pause_at,
             :OIB, :phone_number, :code, :groups, :membership_types, :member_attendances
end
