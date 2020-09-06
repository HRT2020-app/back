class ApplicationController < ActionController::API
    def response_bad_request
        render status: 400, json: { status: 400, message: 'Bad Request' }
    end
end
