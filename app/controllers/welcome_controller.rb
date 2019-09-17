class WelcomeController < ApplicationController
  def index
    @teste = params[:nome]
  end
end
