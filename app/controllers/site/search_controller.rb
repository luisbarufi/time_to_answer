class Site::SearchController < SiteController

  def questions
    @questions = Question.search_term(params[:page], params[:term])

    @questions_count = @questions.all.to_a.size
  end

  def subject
    @questions = Question.search_term_subject(params[:page], params[:subject_id])
  end
end
