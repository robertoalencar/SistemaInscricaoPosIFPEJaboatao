package main.br.org.ifpe.inscricaopos.entidade;

import java.util.Date;

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

    private static final long serialVersionUID = 1154330982477969190L;

    @Column
    private String numero;

    @Column
    private Integer classificacao;

    @ManyToOne
    @JoinColumn(name = "candidato_id")
    private Candidato candidato;

    @Column
    private Date dataInscricao;

    // private List<Avaliacao> avaliacoes;

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
    /*
     * public List<Avaliacao> getAvaliacoes() { return avaliacoes; }
     * 
     * public void setAvaliacoes(List<Avaliacao> avaliacoes) { this.avaliacoes =
     * avaliacoes; }
     */
}
