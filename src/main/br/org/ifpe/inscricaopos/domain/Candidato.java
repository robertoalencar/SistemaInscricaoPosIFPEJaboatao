package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author Roberto Alencar
 *
 */
@Entity
public class Candidato implements Serializable {

    private static final long serialVersionUID = -6657633521233266286L;

    @Id
    @SequenceGenerator(name = "CANDIDATO_SEQUENCE", sequenceName = "candidato_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "CANDIDATO_SEQUENCE", strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column
    private boolean habilitado;

    @Column
    private String nome;

    @Column
    private String cpf;

    @Column
    private String sexo;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column
    private Date dataNacimento;

    @Column(name = "email")
    private String email;

    @Column
    private String foneResidencial;

    @Column
    private String foneCelular;

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

    public String getNome() {
	return nome;
    }

    public void setNome(String nome) {
	this.nome = nome;
    }

    public String getCpf() {
	return cpf;
    }

    public void setCpf(String cpf) {
	this.cpf = cpf;
    }

    public String getSexo() {
	return sexo;
    }

    public void setSexo(String sexo) {
	this.sexo = sexo;
    }

    public Date getDataNacimento() {
	return dataNacimento;
    }

    public void setDataNacimento(Date dataNacimento) {
	this.dataNacimento = dataNacimento;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getFoneResidencial() {
	return foneResidencial;
    }

    public void setFoneResidencial(String foneResidencial) {
	this.foneResidencial = foneResidencial;
    }

    public String getFoneCelular() {
	return foneCelular;
    }

    public void setFoneCelular(String foneCelular) {
	this.foneCelular = foneCelular;
    }

}
