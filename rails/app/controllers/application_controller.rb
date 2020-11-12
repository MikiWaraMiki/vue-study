class ApplicationController < ActionController::API
  before_action :params_snakize
  # 400 Bad Request
  def response_400
    render status: 400, json: { status: 400, message: 'Bad Request' }
  end

  # 404 Not Found
  def response_not_found(class_name = 'page')
    render status: 404, json: { status: 404, message: "#{class_name.capitalize} Not Found" }
  end

  # 401 Response
  def response_unauthorized(message= "Unatuhorized. Please check your role.")
    render status: 401,
            json: {
              status: 401,
              message: message
            }
  end

  # 422 Response
  def response_unprocessable_entity(errors)
    render status: :unprocessable_entity,
            json: {
              status: 422,
              errors: errors
            }
  end

  # 500 InternalServerError
  def response_internal_server_error(exception=nil)
    render status: :internal_server_error,
            json: {
              status: 500,
               errors: "Internal Server Error. Please Retry Again."
            }
  end

  private

  # parameterをスネークケースに変換
  def params_snakize
    params.deep_snakeize!
  end
end
