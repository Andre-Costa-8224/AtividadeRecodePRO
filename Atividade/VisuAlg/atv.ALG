Algoritmo "semnome"

// Descrição   : um menu para simular um cadastro para uma agência de viagens
//               com os seguintes dados: cadastro de cliente e cadastro de
//               destino, criar também uma consulta para cada estrutura de
//               dados.

// Autor(a)    : André F S Costa

Var

   cad_cliente:vetor[1..9] de inteiro
   cad_viagens:vetor[1..3] de caractere
   conf:caractere
   condicao:logico
   nome:vetor[1..10] de caractere
   cpf:vetor[1..10] de inteiro
   ncondicao:logico
   res:inteiro
   indice:inteiro
   cliente:inteiro
   cli_regis:vetor[1..10,1..2] de inteiro
   cli_viagens:vetor[1..10,1..3] de caractere
   condicaop:logico
   leitorcpf:inteiro
   leitornum:caractere
   i:inteiro
   contador_cli:inteiro
   contador_regis:inteiro
   index:inteiro
   cont_cli:inteiro
Inicio
   condicaop <- verdadeiro
   ncondicao <- verdadeiro
   escreval("Esta é a agencia de viagens da recode, seja bem vinda(o)!")
   enquanto condicaop faca
   escreval("")
   escreval("Este é o menu:")
   escreval("")
   escreva("cadastrar[1]")
   escreva(" ver cadastrado[2]")
   escreval(" ver destinos cadastrados[3]")
   escreval(" para sair digite 9")
   escreva("-")
   leia(res)
   escreval("")
   se res = 1 entao
      condicao <- verdadeiro
   fimse
   se res = 2 entao
      se cliente > 0 entao
         escreval("Digite seu nome:")
         leia(leitornum)
         escreval("Digite seu cpf:")
         leia(leitorcpf)
         para cont_cli de 1 ate 10 faca
              se leitorcpf = cpf[cont_cli] entao
                 index <- cont_cli
              fimse
         fimpara
         se leitorcpf = cpf[index] entao
            se leitornum = nome[index] entao
               escreval("Olá cliente ",nome[index]," seu numero de cadastro é:", cli_regis[index])
               i <- 0
               para indice de 1 ate 10 faca
                    para cont_cli de 1 ate 3 faca
                         se index = indice entao
                            se cli_viagens[indice,cont_cli] <> "" entao
                              i <- i + 1
                           fimse
                         fimse
                    fimpara
               fimpara
               escreval("Você tem um total de: ", i," viagens cadastradas")
            senao
               escreval("cpf ou nome incorreto!")
         senao
              escreval("nome ou cpf incorreto!")
            fimse
         fimse

      senao
         escreval("voce ainda nao tem cadastro")
      fimse
   fimse
   
   se res = 3 entao
      se cad_viagens[1] = "" entao
         se cliente <> 0 entao
            escreval("Nenhuma viagem foi cadastrada!")
         fimse
         se cliente = 0 entao
            escreval("voce ainda nao tem cadastro!")
         fimse
      senao
           escreval("Digite seu nome")
           leia(leitornum)
           escreval("Digite seu cpf:")
           leia(leitorcpf)
           para cont_cli de 1 ate 10 faca
              se leitorcpf = cpf[cont_cli] entao
                 index <- cont_cli
              fimse
           fimpara
           se leitorcpf = cpf[index] entao
              se leitornum = nome[index] entao
                 escreval("Suas viagens cadastradas foram:")
                 para indice de 1 ate 10 faca
                      para i de 1 ate 3 faca
                           se index = indice entao
                              escreval(cli_viagens[indice,i])
                           fimse
                      fimpara
                 fimpara
              senao
                escreval("Cpf e/ou numero de registro incorretos!")
              fimse
           fimse
      fimse
   fimse
   se res = 9 entao
      escreval("volte sempre!")
      condicaop <- falso
   fimse
   
   enquanto condicao faca
            escreval("deseja se cadastrar?[S/N]")
            leia(conf)
            se conf = "S" entao
                 escreval("digite seu nome:")
                 contador_cli <- contador_cli + 1
                 leia(nome[contador_cli])
                 escreval("digite seu cpf:")
                 leia(cpf[contador_cli])
                 para indice de 1 ate 9 faca
                      cad_cliente[indice] <- randi(100000)
                      cliente <- cliente + cad_cliente[indice]
                 fimpara
                 contador_regis <- contador_regis + 1
                 se contador_regis < 11 entao
                    cli_regis[contador_regis,1] <- cliente
                    cli_regis[contador_regis,2] <- cpf[contador_regis]
                 fimse
                 escreval("Cadastrado com sucesso. Seu numero de cadastro é:",cliente)
                 escreval("deseja cadastrar um destino?[S/N]")
                 leia(conf)
                 se conf = "S" entao
                      escreval("Você pode cadastrar até 3 viagens de uma vez!")
                      escreval("Escolha qualquer lugar do mundo!")
                      para indice de 1 ate 3 faca
                           leia(cad_viagens[indice])
                      fimpara
                      
                      para indice de 1 ate 10 faca
                           para i de 1 ate 3 faca
                                se cli_regis[indice,1] = cliente entao
                                   cli_viagens[indice,i] <- cad_viagens[i]
                                fimse
                           fimpara
                      fimpara
                      
                      escreval("Viagens cadastradas com sucesso!")
                 fimse
                 se conf <> "S" entao
                    se conf = "N" entao
                       condicao <- falso
                    senao
                         escreval("Erro, tente novamente[S/N]:")
                         enquanto ncondicao faca
                                  leia(conf)
                                  se conf <> "S" entao
                                     se conf <> "N" entao
                                        escreval("Continua incorreto![S/N]:")
                                     senao
                                          ncondicao <- falso
                                     fimse
                                     senao
                                          ncondicao <- falso
                                  fimse
                         fimenquanto
                    fimse
                 fimse
            fimse
            se conf = "N" entao
                  condicao <- falso
            fimse
            se conf <> "N" entao
               se conf <> "S" entao
                  escreval("Erro!")
               fimse
            fimse
            
   fimenquanto
   fimenquanto
Fimalgoritmo
