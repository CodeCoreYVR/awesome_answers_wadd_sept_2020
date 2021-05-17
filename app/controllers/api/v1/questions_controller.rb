class Api::V1::QuestionsController < Api::ApplicationController
    before_action :find_question, only:[:show, :destroy, :update]

    def index
        questions = Question.order created_at: :desc
        render json: questions, each_serializer: QuestionCollectionSerializer
    end

    def show
        #question = Question.find params[:id]
        render json: @question
    end

    def destroy
        #question = Question.find params[:id]
        if @question.destroy
            head :ok
        else
            head :bad_request
        end
    end

    private
    def find_question
        @question = Question.find params[:id]
    end
end


# Use this command to generate questions controller 'rails g controller api/v1/questions --no-assets --no-helper --skip-template-engine'