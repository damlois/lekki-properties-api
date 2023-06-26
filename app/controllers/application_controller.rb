class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_rescue

    def record_not_found_rescue(exception)
        logger.info("#{exception.class}: " + exception.message)
        if Rails.env.production?
        render json: {}, status: :not_found
        else
        render json: { message: "Property does not exist" }, status: :not_found
        end
    end
end
