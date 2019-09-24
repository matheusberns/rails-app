class WelcomeController < ApplicationController
  def index
    @teste = params[:nome]
    logger.info("Tela carregada com sucesso!".green)
  end
end
