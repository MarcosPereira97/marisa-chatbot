#language: pt
@regressao
Funcionalidade: Chatbot

    Contexto: Acessar o site
        Dado que eu acesse o site do "Chatbot"

    @success
    Cenário: Fluxo de sucesso
        Quando preencho todos os campos do formulário corretamente
        E clico no botão "ENTRAR NO CHAT"
        Então sou redirecionado para o chat

    @chatbot
    Cenário: Tentativa de login sem dados obrigatórios
        Quando clico no botão "ENTRAR NA CONTA" sem preencher os dados do formulário
        Então a mensagem "Os campos identificados com asteriscos (*) são de preenchimento obrigatório." é exibida
        E não sou redirecionado para o chat

    @email
    Esquema do Cenário: Tentativa de login com dados inválidos
        Quando insiro apenas os campos <email>, <telefone> e <cpf> inválidos
        E clico no botão "ENTRAR NO CHAT"
        Então a informação de campo inválido é exibida
        E não sou redirecionado para o chat

        Exemplos: 
            | email            | telefone      | cpf           |
            | "marcos.junior@" | "99 914"      | " 1990"       |
            | "xpto123"        | "99999999999" | " 297 978"    |
            | "&%#$@"          | " 1990"       | "99999999999" |