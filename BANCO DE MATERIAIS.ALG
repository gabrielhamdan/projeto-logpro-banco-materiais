Algoritmo "projeto_logica_prog"
Tipo
   usuario = registro
      nome:caractere
      senha:caractere
   fimregistro


Var
   opMenu,exibirMenu,opInvalida:inteiro
   pesquisa:caracter
   usuarios:vetor[0..9] de usuario

   nomeUsuario,senhaUsuario:caractere

   estaLogado:logico

Inicio
   estaLogado <- falso

procedimento mostrarMenuInicial
inicio
   exibirMenu <- 1
   opInvalida <- 0

   REPITA
      escreval("#########################################")
      escreval("#   B A N C O  D E  M A T E R I A I S   #")
      escreval("#########################################")
      escreval("#                                       #")
      escreval("#   1-Pesquisar material                #")
      escreval("#   2-Cadastrar material                #")
      escreval("#   3-Sair                              #")
      escreval("#                                       #")
      SE opInvalida = 0 ENTAO
         escreval("#                                       #")
      SENAO
         escreval("#            Op??o inv?lida!            #")
      FIMSE
      escreval("#########################################")
      escreva("Digite a op??o desejada: ")
      leia(opMenu)

      ESCOLHA opMenu
      CASO 1
         limpatela
         exibirMenu <- 0
         mostrarMenuPesquisa
      CASO 2
         limpatela
         SE estaLogado ENTAO
            CadastroMateriais
         SENAO
            mostrarTelaLogin
         FIMSE
         exibirMenu <- 0
      CASO 3
         limpatela
         exibirMenu <- 0
         mostrarMenuSair
      OUTROCASO
         limpatela
         opInvalida <- 1
      FIMESCOLHA
   ATE exibirMenu = 0
fimprocedimento


procedimento mostrarMenuPesquisa
inicio
   escreval("#########################################")
   escreval("#   B A N C O  D E  M A T E R I A I S   #")
   escreval("#########################################")
   escreval("#                                       #")
   escreval("#      BUSQUE POR T?TULO, AUTORIA,      #")
   escreval("#      DISCIPLINA, ETC.                 #")
   escreval("#                                       #")
   escreval("#                                       #")
   escreval("# Digite < para voltar                  #")
   escreval("#########################################")
   escreva("Digite sua busca: ")
   leia(pesquisa)

   ESCOLHA pesquisa
   CASO "<"
      limpatela
      mostrarMenuInicial
   OUTROCASO
      limpatela
      mostrarResultadoBusca
   FIMESCOLHA
fimprocedimento


procedimento mostrarResultadoBusca
inicio

   escreval("Voc? pesquisou por '", pesquisa,"'")
   escreval("")
   escreval("N?o h? resultados para essa pesquisa.")
   redirecionarPagina

fimprocedimento


procedimento CadastroMateriais
inicio

   escreval("N?o ? poss?vel cadastrar materiais no momento.")
   redirecionarPagina

fimprocedimento


procedimento mostrarMenuSair
Var
   querSair:caracter

Inicio
   exibirMenu <- 1
   opInvalida <- 0

   REPITA
      escreval("#########################################")
      escreval("#   B A N C O  D E  M A T E R I A I S   #")
      escreval("#########################################")
      escreval("#                                       #")
      escreval("#   1-Tem certeza de que deseja         #")
      escreval("#     sair?                             #")
      escreval("#                                       #")
      escreval("#                                       #")
      SE opInvalida = 0 ENTAO
         escreval("#                                       #")
      SENAO
         escreval("#            Op??o inv?lida!            #")
      FIMSE
      escreval("#########################################")
      escreva("[S/N]? ")
      leia(querSair)
      querSair <- Maiusc(querSair)

      ESCOLHA querSair
      CASO "S"
         limpatela
         exibirMenu <- 0
      CASO "N"
         limpatela
         exibirMenu <- 0
         mostrarMenuInicial
      OUTROCASO
         limpatela
         opInvalida <- 1
      FIMESCOLHA
   ATE exibirMenu = 0
fimprocedimento


procedimento redirecionarPagina
inicio
   escreval("")
   escreval("---------------------------------------------")
   escreval("Redirecionando para a p?gina inicial...")
   timer(700)
   escreval(".")
   escreval(".")
   escreval(".")
   timer(0)
   limpatela
   mostrarMenuInicial

fimprocedimento


procedimento mostrarTelaLogin
inicio
   exibirMenu <- 1
   opInvalida <- 0

   REPITA
      escreval("#########################################")
      escreval("#   B A N C O  D E  M A T E R I A I S   #")
      escreval("#########################################")
      escreval("#                                       #")
      escreval("#   1-Logar-se                          #")
      escreval("#   2-Cadastrar-se                      #")
      escreval("#                                       #")
      escreval("#                                       #")
      SE opInvalida = 0 ENTAO
         escreval("# Digite 0 para voltar                  #")
      SENAO
         escreval("#            Op??o inv?lida!            #")
      FIMSE
      escreval("#########################################")
      escreva("> ")

      SE opInvalida = 1 ENTAO
         timer(700)
         timer(0)
         opInvalida <- 0
         limpatela
         mostrarTelaLogin
         interrompa
      FIMSE

      leia(opMenu)

      ESCOLHA opMenu
      CASO 1
         limpatela
         exibirMenu <- 0
         autenticarUsuario
      CASO 2
         limpatela
         exibirMenu <- 0
         cadastrarUsuario
      CASO 0
         limpatela
         exibirMenu <- 0
         mostrarMenuInicial
      OUTROCASO
         limpatela
         opInvalida <- 1
      FIMESCOLHA
   ATE exibirMenu = 0
fimprocedimento


procedimento cadastrarUsuario
Var
   usuarioValido:logico
   i:inteiro

inicio
   exibirMenu <- 1
   usuarios[0].nome <- "gabriel"

   REPITA
      usuarioValido <- verificarUsuarioExistente

      SE usuarioValido ENTAO
         exibirMenu <- 0
      SENAO
         limpatela
         escreval("Usu?rio j? existente! Tente outro nome de usu?rio.")
      FIMSE
   ATE exibirMenu = 0

   validarSenha

   limpatela

   PARA i DE 0 ATE 9 FACA
      SE usuarios[i].nome <> "" ENTAO
         usuarios[i].nome <- nomeUsuario
         usuarios[i].senha <- senhaUsuario
         interrompa
      FIMSE
   FIMPARA

   escreval("Usu?rio cadastrado com sucesso!")
   escreval("---------------------------------------------")
   escreva("Redirecionando para a p?gina inicial ")
   timer(800)
   escreva(". ")
   escreva(". ")
   escreva(". ")
   escreva("")
   timer(0)

   limpatela

   mostrarTelaLogin
fimprocedimento


funcao verificarUsuarioExistente:logico
Var
   i:inteiro
   usuarioValido:logico

inicio
   i <- 0
   usuarioValido <- verdadeiro

   REPITA
      escreval("Digite um nome de usu?rio")
      escreva("> ")
      leia(nomeUsuario)

      SE nomeUsuario = "" ENTAO
         limpatela
      FIMSE
   ATE nomeUsuario <> ""

   PARA i DE 0 ATE 9 FACA
      SE usuarios[i].nome = nomeUsuario ENTAO
         usuarioValido <- falso
         interrompa
      FIMSE
   FIMPARA

   retorne usuarioValido
fimfuncao


procedimento validarSenha
inicio
   REPITA
      limpatela
      escreval("Digite uma senha: ")
      escreva("> ")
      leia(senhaUsuario)
   ATE senhaUsuario <> ""
fimprocedimento


procedimento autenticarUsuario
Var
   usuario,senha:caractere

inicio
   //add logica autenticacao

   escreva("USU?RIO: ")
   leia(usuario)
   escreva("SENHA: ")
   leia(senha)

fimprocedimento


mostrarMenuInicial

Fimalgoritmo