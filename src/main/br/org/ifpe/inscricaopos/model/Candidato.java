package main.br.org.ifpe.inscricaopos.model;

import java.util.Date;

/**
 * @author Roberto Alencar
 *
 */
public class Candidato extends EntidadeNegocio {

    private String nome;
    private String cpf;
    private String sexo;
    private Date dataNacimento;
    private String email;
    private String foneResidencial;
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
