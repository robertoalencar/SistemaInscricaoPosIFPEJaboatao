package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

/**
 * @author Roberto Alencar
 *
 */
@Entity
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1992758835748163813L;

    @Id
    @SequenceGenerator(name = "USUARIO_SEQUENCE", sequenceName = "usuario_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "USUARIO_SEQUENCE", strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column
    private boolean habilitado;

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

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public boolean isHabilitado() {
	return habilitado;
    }

    public void setHabilitado(boolean habilitado) {
	this.habilitado = habilitado;
    }

    public TipoUsuario getTipo() {
	return tipo;
    }

    public void setTipo(TipoUsuario tipo) {
	this.tipo = tipo;
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
