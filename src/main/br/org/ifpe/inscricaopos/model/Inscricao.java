package main.br.org.ifpe.inscricaopos.model;

import java.util.List;

/**
 * @author Roberto Alencar
 *
 */
public class Inscricao extends EntidadeNegocio {

    private Integer numero;
    private Integer classificacao;
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
