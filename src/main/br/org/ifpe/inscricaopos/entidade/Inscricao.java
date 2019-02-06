package main.br.org.ifpe.inscricaopos.entidade;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

import main.br.org.ifpe.inscricaopos.util.EntidadeNegocio;

/**
 * @author Roberto Alencar
 *
 */
@Entity
public class Inscricao extends EntidadeNegocio {

    private static final long serialVersionUID = 1154330982477969190L;

    @Column
    private String numero;

    @Column
    private Integer classificacao;

    @ManyToOne
    private Candidato candidato;

    @Column
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dataInscricao;

    @OneToMany(fetch = FetchType.EAGER)
    private List<Avaliacao> avaliacoes;

    public String getNumero() {
	return numero;
    }

    public void setNumero(String numero) {
	this.numero = numero;
    }

    public Integer getClassificacao() {
	return classificacao;
    }

    public void setClassificacao(Integer classificacao) {
	this.classificacao = classificacao;
    }

    public Candidato getCandidato() {
	return candidato;
    }

    public void setCandidato(Candidato candidato) {
	this.candidato = candidato;
    }

    public Date getDataInscricao() {
	return dataInscricao;
    }

    public void setDataInscricao(Date dataInscricao) {
	this.dataInscricao = dataInscricao;
    }

    public List<Avaliacao> getAvaliacoes() {
	return avaliacoes;
    }

    public void setAvaliacoes(List<Avaliacao> avaliacoes) {
	this.avaliacoes = avaliacoes;
    }

}
