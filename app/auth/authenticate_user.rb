class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :email, :password

  #this is where parameters are taken when the command is called
  def initialize(email, password)
    @email = email
    @password = password
  end
  
  #this is where the result gets returned
  def call
    # JsonWebToken.encode({user_login_detail_id: user.id, email: user.email, password: user.password}) if user
    JsonWebToken.encode({id: user_login_detail.id, email: user_login_detail.email}) if user_login_detail
  end

  private

  def user_login_detail
    user_login_detail = UserLoginDetail.find_by_email(email)
    return user_login_detail if user_login_detail && user_login_detail.authenticate(password)

    errors.add :user_authentication, 'Invalid credentials'
    nil
  end
end