package ExViagens;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		String linhas = "----------------";
		String nome = "";
		Armazenamento cli_viagens = new Armazenamento();
		long cpf;
		long telefone;
		long registro = 0;
		long cad[][] = new long[3][3];
		String cli_nome[] = new String[3];
		int contador = 0;
		String viagem;
		Scanner input = new Scanner(System.in);
		System.out.println(linhas+" Bem vindo(a) a Agencia de Viagens Recode! "+linhas);
		String vf;
		int cont = 0;
		int dest;
		int cli = 0;
		boolean condicional = true;
		boolean cond = true;
		while (true) {
			
			System.out.println("Para cadastrar digite 1"+"  ||  "+"para consulta de dados digite 2"+"  ||  "+"para cadastrar viagens digite 3"+"  ||  "+"para sair digite 9");
			
			int opc = input.nextInt();
			
			if (opc==1) {
				System.out.println("digite seu nome");
				nome = input.next();
				System.out.println("digite seu cpf:");
				cpf = input.nextLong();
				System.out.println("digite seu numero de telefone para contato:");
				telefone = input.nextLong();
				cli_nome[contador] = nome;
				cad[contador][0] = cpf;
				cad[contador][1] = registro;
				cad[contador][2] = telefone;
				registro++;
				contador++;
				while (condicional) {
					System.out.println("Deseja cadastrar viagens?");
					System.out.print("[S/N]: ");
					vf = input.next();
					if (vf.equalsIgnoreCase("s")) {
						System.out.println("Quantos destinos deseja cadastrar? [maximo: 3 destinos de uma vez]");
						dest = input.nextInt();
						
						for (int i = cli; i < cli+1; i++) {
							
							for (int j = 0; j < dest; j++) {
								viagem = input.next();
								
								cli_viagens.defViagens(i,j,viagem);
							}
								
						}
						System.out.println("LEMBRETE:\nSEU NUMERO DE REGISTRO É "+cli);
						cli++;
						break;
						
					}else if (vf.equalsIgnoreCase("n")) {
						condicional = false;
						
					}else {
						System.out.println("Erro!");
					}
				}
				
			}else if (opc==2) {
				cond = true;
				System.out.println("digite seu cpf:");
				cpf = input.nextLong();
				System.out.println("digite seu numero de registro");
				cont = input.nextInt();
				if (cont<3) {
					for (int i = cont; i < cli_nome.length; i++) {
						for (int j = 0; j < cli_nome.length; j++) {
							if (cad[i][0] == cpf && cad[i][1] == cont) {
								if (cond) {
									System.out.println("Olá "+cli_nome[i]);
									System.out.println("Seus dados:\nCPF || registro || telefone");
									cond = false;
								}
								System.out.print(cad[i][j]+"       ");
							}else {
								if (cad[cont][0] != cpf && cad[i][cont] != cont) {
									System.out.println("Dados incorretos ou faltantes!");
								}
								break;
							}
						}
					}
					System.out.println("\nSuas viagens cadastradas foram:");
					for (int i = cont; i < cli_nome.length; i++) {
						for (int j = 0; j <	3; j++) {
							if (cad[i][0] == cpf && cad[i][1] == cont) {
									if (cli_viagens.getViagens(i, j) != null) {
										System.out.println(cli_viagens.getViagens(i,j));
									}
							}
						}
					}
				}
				else {
					System.out.println("Dados incorretos ou faltantes!");
				}
				System.out.println("");
			}else if (opc==3) {
				continue;
			}else if(opc==9) {
				break;
			}else {
				System.out.println("Erro!");
			}
		}
		input.close();
	}

}
