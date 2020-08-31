module SiteHelper

  def jumbotron_message
    {
      "index" => "Ultimas Perguntas cadastradas...",
      "questions" => "Resultado para o termo: \"#{params[:term]}\"...",
      "subject" => "Mostrando questões para o assunto \"#{params[:subject]}\"..."
    }[params[:action]]
  end
end
