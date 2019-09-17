namespace :dev do
  desc "Configurar ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco de dados...") {%x(rails db:drop)}
      show_spinner("Criando banco de dados...") {%x(rails db:create)}
      show_spinner("Migrando banco de dados...") {%x(rails db:migrate)}
      show_spinner("Carregando seeds...") {%x(rails db:seed)}
    else
      puts "Você não está em modo de desenvolvimento!"
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
