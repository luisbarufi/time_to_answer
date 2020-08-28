class Site::SearchController < SiteController

  def questions
    @questions = Question.includes(:answers)
                         .where('lower(description) LIKE ?', "%#{params[:term].downcase}%")
                         .page(params[:page])

    @questions_count = @questions.all.to_a.size
  end
end
