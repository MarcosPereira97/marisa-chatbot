Dado("que eu acesse o site do {string}") do |site|
  @chatbot.acessa_site(site)
end

Quando("preencho todos os campos do formulário corretamente") do
  @chatbot.formulario_dados_corretos
end

Quando("insiro apenas os campos {string}, {string} e {string} inválidos") do |valor1, valor2, valor3|
  @chatbot.formulario_dados_invalido(valor1, valor2, valor3)
end

Quando("clico no botão {string}") do |string|
  @chatbot.confirma_acesso
end

Quando("clico no botão {string} sem preencher os dados do formulário") do |string|
  @chatbot.confirma_acesso
end

Então("a informação de campo inválido é exibida") do
  @chatbot.valida_erros
end

Então("a mensagem {string} é exibida") do |msg_erro|
  @chatbot.valida_campos_obrigatorios(msg_erro)
end

Então("sou redirecionado para o chat") do
  @chatbot.valida_acesso
end

Então("não sou redirecionado para o chat") do
end