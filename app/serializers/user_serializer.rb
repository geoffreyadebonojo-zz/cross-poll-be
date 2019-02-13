class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :api_token
end
