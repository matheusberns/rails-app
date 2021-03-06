namespace :dev do
  desc "Configura ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping database...") {%x(rails db:drop)}
      show_spinner("Creating database...") {%x(rails db:create)}
      show_spinner("Migrating database...") {%x(rails db:migrate)}
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
      %x(rails dev:add_users)
    else
      puts "You aren't in development mode!"
    end
  end

  desc "Cria usuário admin"
  task add_users: :environment do
    show_spinner("Registering default admin user...") do
      admin = {
          email: "admin@admin.com",
          password: "160499",
          role: "admin"
      }
      User.find_or_create_by(admin)

    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Registering coins...") do
      coins = [
          {
              description: "Bitcoin",
              acronym: "BTC",
              url_image: "http://s.glbimg.com/po/tt2/f/original/2014/01/02/gpc20140102.jpg",
              mining_type: MiningType.find_by(acronym: 'PoW'),
              price: 40.121
          },
          {
              description: "Ethereum",
              acronym: "ETH",
              url_image: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fdavealtavilla%2Ffiles%2F2017%2F06%2FEthereum-logo-720px.jpg",
              mining_type: MiningType.all.sample,
              price: 812.36
          },
          {
              description: "Dash",
              acronym: "DASH",
              url_image: "https://wiki.trezor.io/images/Litecoin.png",
              mining_type: MiningType.all.sample,
              price: 3678.72
          },
          {
              description: "Iota",
              acronym: "IOT",
              url_image: "https://guiadobitcoin.com.br/wp-content/uploads/2017/12/iota-png.png",
              mining_type: MiningType.all.sample,
              price: 1.18
          },
          {
              description: "Zcash",
              acronym: "ZEC",
              url_image: "https://z.cash/wp-content/uploads/2019/03/zcash-icon-fullcolor.png",
              mining_type: MiningType.all.sample,
              price: 185.41
          },
          {
              description: "Stellar",
              acronym: "XLM",
              url_image: "https://cdn.iconscout.com/icon/premium/png-256-thumb/stellar-4-973888.png",
              mining_type: MiningType.all.sample,
              price: 0.29
          }
      ]
      coins.each do |coin|
        Coin.find_or_create_by(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Registering mining types...") do
      mining_types = [
          {description: "Proof of Work", acronym: "PoW"},
          {description: "Proof of Stake", acronym: "PoS"},
          {description: "Proof of Payment", acronym: "PoP"},
          {description: "Proof of Concept", acronym: "PoC"}
      ]
      mining_types.each do |mtype|
        MiningType.find_or_create_by(mtype)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Done!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
