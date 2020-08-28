class Site::AnswerController < SiteController
  
  def question
    p ">>>>>>>>>>>>>>>>>>#{params[:answer]}"
  end
end
