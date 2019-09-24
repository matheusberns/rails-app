require 'rails_helper'

RSpec.describe Person, type: :model do
  context "Validating person..." do
    it " Pessoa é válido?" do
      person = Person.new
      person.name = "Matheus"
      person.age = 20
      person.genre = "Masculino"

      expect(person.valid?).to be_truthy
    end

    it "Pessoa é de maior?" do
      person = Person.new
      person.name = "Jonas"
      person.age = 15
      person.genre = "Masculino"

      if person.age >= 18
        expect(true).to be_truthy
      else
        expect(false).to be_falsey
      end
    end
  end

  context "Título válidos" do
    it "Titulo completo" do
      person = Person.new
      person.name = "Julia"
      person.age = 25
      person.genre = "Feminino"

      expect(person.titulo_completo).to eql("Sra. Julia - Sexo: Feminino")
    end
  end

end
