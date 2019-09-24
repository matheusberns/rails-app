class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  # before_action :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def set_locale
    if params[:locale]
      cookies[:locale] = params[:locale]
    end

    if cookies[:locale]
      if I18n.locale != cookies[:locale]
        I18n.locale = cookies[:locale]
      end
    end
  end

  private

  def user_not_authorized

    flash[:notice] = "Você não tem permissão para fazer esta ação"
    redirect_to(welcome_index_path)
  end
end
