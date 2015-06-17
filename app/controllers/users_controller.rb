class UsersController < ApplicationController
  def register
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.create(email: params[:email], password: passhash)

    render json: { user: @user }
  end

end
