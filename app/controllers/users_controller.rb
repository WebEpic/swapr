class UsersController < ApplicationController
  def register
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.create!(email: params[:email], password: passhash)

    if @user.save

    	render json: { user: @user.as_json(only: [:id, :email, :access_token]) }, status: :created
    else
    	render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity

    render json: { user: @user }
	end
  end
end
