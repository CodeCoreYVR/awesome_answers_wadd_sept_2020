class QuestionsController < ApplicationController
  def new
    # Create a new instance of a question which will be available
    # as an argument to "form_with"
    @question = Question.new
  end

  def create
    # The 'params' object is available in controllers
    # is composed of the query string, url params,
    # and the body of a form
    # (e.g. req.query + req.params + req.body)

    # render the params as JSON to view a readable format of the data.
    #  This is like doing
    # res.send(req.body) in Express
    # render json: params

    # Use 'require' on the params object to retrieve
    # the nested hash of a key usually corresponding to
    # the name-value pairs of a form

    # Then use permit to specify all input names that
    # are allowable (as symbols).
    question_params = params.require(:question).permit(:title, :body)
    @question = Question.new question_params
    if @question.save
      # The redirect_to method is used for telling the
      # browser to make a new request.
      # The redirect_to method is typically used with
      # with a named route helper. We can pass an id for the
      # question to render, or we can pass the instance itself because
      # rails is smart enough to grab the id from the instance:
      redirect_to question_path(@question)
      redirect_to question_path(@question.id)
    else
      # If we use redirect_to, the data in the body will be gone from the 
      # params. Therefore we will render the new page so the user can see 
      # their inputs in the form to modify it.
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    question_params = params.require(:question).permit(:title, :body)
    if @question.update question_params
      redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def destroy
    # We don't need to define an instance variable here because we're not 
    # using it in a form.
    question = Question.find(params[:id])
    question.destroy
    redirect_to root_path
  end

end
