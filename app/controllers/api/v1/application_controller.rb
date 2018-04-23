module Api
	module V1
		class ApplicationController < ActionController::API
			#include ActionController::MimeResponds
			include ActionController::MimeResponds
			include ActionController::Serialization
			include ActionController::HttpAuthentication::Token::ControllerMethods
			before_action :authenticate_request
			attr_reader :current_user

			include ExceptionHandler

			def self.current_organization
				#byebug
				@current_user.organization_user.organization
			end
			# [...]
			private
			def authenticate_request
				@current_user = AuthorizeApiRequest.call(request.headers).result
				render json: { error: 'Not Authorized' }, status: 401 unless @current_user
			end

			# protected

			#     # Authenticate the user with token based authentication
			#     def authenticate
			#     	byebug
			#         authenticate_token || render_unauthorized
			#     end

			#     def authenticate_token
			#         authenticate_with_http_token do |token, options|
			#             @current_user = User.find_by(api_key: token)
			#         end
			#     end
		end
	end
end
