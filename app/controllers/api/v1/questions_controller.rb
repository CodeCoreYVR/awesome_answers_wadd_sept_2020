class Api::V1::QuestionsController < ApplicationController

    def index
        questions = Question.order created_at: :desc
        render json: questions
    end

    def show
        questions = Question.find params[:id]
        render json: questions
    end

end


# Use this command to generate questions controller 'rails g controller api/v1/questions --no-assets --no-helper --skip-template-engine'