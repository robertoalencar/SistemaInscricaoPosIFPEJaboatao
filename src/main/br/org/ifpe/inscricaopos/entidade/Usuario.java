package main.br.org.ifpe.inscricaopos.entidade;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import main.br.org.ifpe.inscricaopos.util.EntidadeNegocio;

/**
 * @author Roberto Alencar
 *
 */
@Entity
public class Usuario extends EntidadeNegocio {

    private static final long serialVersionUID = -5141339745199942717L;

    @ManyToOne
    private TipoUsuario tipo;

    @Column
    private String nome;

    @Column
    private String siape;

    @Column
    private String login;

    @Column
    private String senha;

    @Column
    private String fone;

    @Column
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
