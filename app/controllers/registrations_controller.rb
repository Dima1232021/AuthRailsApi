class RegistrationsController < ApplicationController
  def create
    email = params['user']['email']
    password = params['user']['password']
    password_confirmation = params['user']['password_confirmation']

    # unless !User.find_by(email: email)
    #   return render json: { status: 400, message: 'Такий користувач вже існує' }
    # end

    # unless password === password_confirmation
    #   render json: { status: 400, message: 'Паролі не співпадають' }
    # end

    user =
      User.create!(
        email: email,
        password: password,
        password_confirmation: password_confirmation,
      )

    if user
      session[:user_id] = user.id
      render json: { status: 201, user: user, message: 'Користувача створено' }
    else
      render json: {
               status: 500,
               message: 'Щось пішло не так. Повторіть спробу',
             }
    end
  end
end
