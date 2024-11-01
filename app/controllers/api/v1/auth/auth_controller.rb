module Api
  module V1
    module Auth
      class AuthController < ApplicationController
        # before_action :verify_jwt, except: [ :sync ]

        def sync
        # Remove the binding.pry for testing
          token = request.headers["Authorization"]&.split(" ")&.last

          begin
            # For testing, let's just log the incoming data
            Rails.logger.info "Received sync request with token: #{token}"
            Rails.logger.info "Params: #{params.inspect}"

            render json: { status: "success" }, status: :ok
          rescue => e
            Rails.logger.error "Sync error: #{e.message}"
            render json: { error: e.message }, status: :unauthorized
          end
        end

        def logout
          # Handle any cleanup needed on logout
          render json: { status: "success" }, status: :ok
        end

        private

        def verify_jwt_token(token)
          public_key = OpenSSL::PKey::RSA.new(Base64.decode64(ENV["FRONTEGG_PUBLIC_KEY"]))
          JWT.decode(
            token,
            public_key,
            true,
            {
              algorithm: "RS256",
              verify_iss: true,
              iss: ENV["FRONTEGG_BASE_URL"]
            }
          )
        end
      end
    end
  end
end
