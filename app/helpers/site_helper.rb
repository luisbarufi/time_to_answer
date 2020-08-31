module SiteHelper

  def jumbotron_message
    case params[:action]
    when 'index'
      "Ultimas Perguntas cadastradas..."      
    when 'questions'
      "Resultado para o termo: \"#{params[:term]}\"..."
    when 'subject'
      "Mostrando questões para o assunto \"#{params[:subject]}\"..."
    end
  end
end
