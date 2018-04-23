module Api
	module V1
		class SessionsController < ApplicationController
			skip_before_action :authenticate_request, only: %i[login]

			def login
				authenticate params[:email], params[:password]
			end

			def logout
				token = request.headers["Authorization"].split(' ').last
				UserAuthLog.find_by(auth_token: token).update(auth_token: "")
				render json: {status: :success, message: "Logout successfully"}
			end

			private

			def authenticate(email, password)
				command = AuthenticateUser.call(email, password)

				if command.success?
					user_login_detail_id = JsonWebToken.decode(command.result)["id"]
					UserAuthLog.create(auth_token: command.result, user_login_detail_id: user_login_detail_id)
					render json: {
						access_token: command.result,
						message: 'Login Successful'
					}
				else
					render json: { error: command.errors }, status: :unauthorized
				end
			end
		end
	end
end
