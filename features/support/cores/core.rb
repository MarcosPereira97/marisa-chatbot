class Methods
  include Capybara::DSL
  include RSpec::Matchers

  ### Métodos ###

  def visit_site(elm)
    visit(EL[elm])
  rescue StandardError => e
    raise "Nao foi possivel acessar o site #{elm}"
  end

  def expect_elm(elm)
    expect(page).to have_css(EL[elm], visible: true)
  end

  def click_element(elm)
    #espera a página carregar todos os itens, e espera achar o elemento
    expect_elm(EL[elm])
    assert_selector(EL[elm])
    first(EL[elm]).click
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}"
  end

  def click_element_and_wait(elm, tempo)
    find(EL[elm], wait: tempo).click
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}"
  end

  def check_element(elm)
    find(EL[elm]).check
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}"
  end

  def set_field(elm, valor)
    find(EL[elm]).set valor
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}"
  end

  def select_option(elm, opcao)
    # Campo "opção" tem que ter um ID em xpath para funcionar
    # Exemplo: "option[2]"
    find(EL[elm]).find(:xpath, opcao).select_option
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}"
  end

  ### Validadores ###

  def valida_elemento_na_pagina(elm)
    expect(page).to have_content elm
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}"
  end

  def valida_texto_na_pagina(texto)
    expect(page).to have_text texto
  rescue StandardError => e
    raise "Nao foi possivel encontrar a mensagem #{texto}"
  end
end