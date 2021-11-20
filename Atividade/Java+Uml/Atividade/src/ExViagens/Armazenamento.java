package ExViagens;

public class Armazenamento {
	private String[][] viagens = new String[3][3];
	
	public void defViagens(int linha, int coluna, String destino) {
		this.viagens[linha][coluna] = destino;
	}
	
	public String getViagens(int i, int j) {
		return this.viagens[i][j];
	}
}
