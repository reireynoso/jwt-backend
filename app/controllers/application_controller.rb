class ApplicationController < ActionController::API
    # before_action :require_login

    def encode_token(payload)
        JWT.encode(payload, 'my_s3cr3t')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token(token)
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def session_user
        decoded_hash = decoded_token(auth_header)
        if !decoded_hash.empty? 
            user_id = decoded_hash[0]['user_id']
        end
    end

    def logged_in?
        !!session_user
    end

    def require_login
     render json: {message: 'Please Login'}, status: :unauthorized unless logged_in?
    end
end
