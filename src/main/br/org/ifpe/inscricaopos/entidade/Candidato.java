package main.br.org.ifpe.inscricaopos.entidade;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;

import org.springframework.format.annotation.DateTimeFormat;

import main.br.org.ifpe.inscricaopos.util.EntidadeNegocio;

/**
 * @author Roberto Alencar
 *
 */
@Entity
public class Candidato extends EntidadeNegocio {

    private static final long serialVersionUID = -4981840235573739373L;

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
