class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def create
        new_signup = Signup.create!(signup_param)
        activity = Activity.find(new_signup.activity_id)
        render json: activity, status: :created
    end

    private

    def signup_param
        params.permit(:time, :camper_id, :activity_id)
    end

    def render_unprocessable_entity
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end
end
