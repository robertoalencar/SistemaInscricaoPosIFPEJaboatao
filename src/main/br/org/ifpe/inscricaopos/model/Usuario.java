package main.br.org.ifpe.inscricaopos.model;

/**
 * @author Roberto Alencar
 *
 */
public class Usuario extends EntidadeNegocio {

    private TipoUsuario tipo;
    private String nome;
    private String siape;
    private String login;
    private String senha;
    private String fone;
    private String email;

    public TipoUsuario getTipo() {
	return tipo;
    }

    public void setTipo(TipoUsuario tipo) {
	this.tipo = tipo;
    }

    public String getLogin() {
	return login;
    }

    public void setLogin(String login) {
	this.login = login;
    }

    public String getSenha() {
	return senha;
    }

    public void setSenha(String senha) {
	this.senha = senha;
    }

    public String getNome() {
	return nome;
    }

    public void setNome(String nome) {
	this.nome = nome;
    }

    public String getSiape() {
	return siape;
    }

    public void setSiape(String siape) {
	this.siape = siape;
    }

    public String getFone() {
	return fone;
    }

    public void setFone(String fone) {
	this.fone = fone;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

}
