Algoritmo "projeto_logica_prog"

Var
   opMenu,exibirMenu,opInvalida:inteiro
   pesquisa,querSair:caracter

Inicio

procedimento mostrarMenuInicial
// menu inicial: entra em loop até opção válida chamar outra tela
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
         escreval("#            Opção inválida!            #")
      FIMSE
      escreval("#########################################")
      escreva("Digite a opção desejada: ")
      leia(opMenu)

      ESCOLHA opMenu
      CASO 1
         limpatela
         exibirMenu <- 0
         mostrarMenuPesquisa
      CASO 2
         limpatela
         escreval("Opção 2 escolhida")
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
   escreval("#      BUSQUE POR TÍTULO, AUTORIA,      #")
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
      // fazer tela e lógica de busca
      escreval("RESULTADO DA PESQUISA")
   FIMESCOLHA
fimprocedimento

procedimento mostrarMenuSair
Inicio
   exibirMenu <- 1
   opInvalida <- 0

   REPITA
      escreval("#########################################")
      escreval("#   B A N C O  D E  M A T E R I A I S   #")
      escreval("#########################################")
      escreval("#                                       #")
      escreval("#       Tem certeza de que deseja       #")
      escreval("#       sair?                           #")
      escreval("#                                       #")
      escreval("#                                       #")
      SE opInvalida = 0 ENTAO
         escreval("#                                       #")
      SENAO
         escreval("#            Opção inválida!            #")
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

// chama menu inicial
mostrarMenuInicial

Fimalgoritmo