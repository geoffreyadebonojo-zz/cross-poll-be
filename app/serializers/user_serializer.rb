class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id,
             :message
end
