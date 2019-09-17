# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas")
spinner.auto_spin

coins = [
          {
              description: "Bitcoin",
              acronym: "BTC",
              url_image: "http://s.glbimg.com/po/tt2/f/original/2014/01/02/gpc20140102.jpg"
          },
          {
              description: "Ethereum",
              acronym: "ETH",
              url_image: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fdavealtavilla%2Ffiles%2F2017%2F06%2FEthereum-logo-720px.jpg"
          },
          {
              description: "Dash",
              acronym: "DASH",
              url_image: "https://wiki.trezor.io/images/Litecoin.png"
          }
        ]

coins.each do |coin|
  sleep(0.5)
  Coin.find_or_create_by(coin)
end

spinner.success("(Concluído!)")
