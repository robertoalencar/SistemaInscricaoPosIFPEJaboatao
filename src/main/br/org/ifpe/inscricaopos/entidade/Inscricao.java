package main.br.org.ifpe.inscricaopos.entidade;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import main.br.org.ifpe.inscricaopos.util.EntidadeNegocio;

/**
 * @author Roberto Alencar
 *
 */
@Entity
@Table(name = "inscricao")
public class Inscricao extends EntidadeNegocio {

    @Column
    private Integer numero;

    @Column
    private Integer classificacao;

    @ManyToOne
    @JoinColumn
    private Candidato candidato;

    private List<Avaliacao> avaliacoes;

    public Integer getNumero() {
	return numero;
    }

    public void setNumero(Integer numero) {
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

    public List<Avaliacao> getAvaliacoes() {
	return avaliacoes;
    }

    public void setAvaliacoes(List<Avaliacao> avaliacoes) {
	this.avaliacoes = avaliacoes;
    }

}
