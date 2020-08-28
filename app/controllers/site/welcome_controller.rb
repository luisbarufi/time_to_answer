class Site::WelcomeController < SiteController
  def index
    @questions = Question.lest_questions(params[:page])
  end
end
