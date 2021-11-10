class RegistrationsController < ApplicationController
  def create
    username = params['user']['username']
    email = params['user']['email']
    password = params['user']['password']
    password_confirmation = params['user']['password_confirmation']

    user =
      User.create!(
        username: username,
        email: email,
        password: password,
        password_confirmation: password_confirmation,
      )
    session[:user_id] = user.id
    render json: { status: :created, user: user }
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.to_s, status: 400 }
  end
end
