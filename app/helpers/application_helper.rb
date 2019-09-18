module ApplicationHelper
  def ambiente_rails
    if Rails.env.development?
      t('amb_dev.dev')
    elsif Rails.env.production?
      t('amb_dev.production')
    else
      "Teste"
    end
  end

  def language_image
    if I18n.locale == :en
           "http://www.novomilenio.inf.br/porto/mapas/images/usband.gif"
    else
      "https://www.pinclipart.com/picdir/middle/158-1582812_brasil-icons-icon-brasil-clipart.png"
    end
  end
end
