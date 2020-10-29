class Chatbot < Methods
  include Capybara::DSL

  def initialize
    @nome = Faker::TvShows::SouthPark.character
    @email = Faker::Internet.free_email
    @telefone = Faker::PhoneNumber.cell_phone
    @cpf = Faker::CPF.pretty

    # Opções do combobox
    @cartao_lojaFisica = "option[2]"
    @loja_virtual = "option[3]"
  end

  def acessa_site(site)
    visit_site(site)
  end

  def preenche_formulario
    set_field("nome", " ")
    set_field("email", " ")
    set_field("telefone", " ")
    set_field("cpf", " ")
    select_option("area_atendimento", @cartao_lojaFisica)
  end

  def formulario_dados_corretos
    self.preenche_formulario
    set_field("nome", @nome)
    set_field("email", @email)
    set_field("telefone", @telefone)
    set_field("cpf", @cpf)
  end

  def formulario_dados_invalido(valor1, valor2, valor3)
    self.preenche_formulario
    set_field("email", valor1)
    set_field("telefone", valor2)
    set_field("cpf", valor3)
  end

  def confirma_acesso
    click_link_or_button 'Entrar'
  end

  def valida_acesso
    assert_selector(".vinter-spinner")
    valida_texto_na_pagina("Olá, #{@nome}!")
  end

  def valida_campos_obrigatorios(msg_erro)
    valida_texto_na_pagina(msg_erro)  
  end

  def valida_erros
    valida_texto_na_pagina("Telefone inválido")
    valida_texto_na_pagina("Email inválido")
    valida_texto_na_pagina("CPF inválido")
  end
end
