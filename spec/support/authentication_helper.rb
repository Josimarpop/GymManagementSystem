module AuthenticationHelper
  def sign_in admin
    request.headers['Authorization'] = "Token token=#{admin.auth_token}, identifier=#{admin.username}"
  end

  def sign_out
    request.headers['Authorization'] = nil
  end
end