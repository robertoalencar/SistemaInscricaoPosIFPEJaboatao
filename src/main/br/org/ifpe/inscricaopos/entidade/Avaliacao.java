package main.br.org.ifpe.inscricaopos.entidade;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import main.br.org.ifpe.inscricaopos.util.EntidadeNegocio;

/**
 * @author Roberto Alencar
 *
 */
@Entity
public class Avaliacao extends EntidadeNegocio {

    private static final long serialVersionUID = -5494147717652762017L;

    @ManyToOne
    @JoinColumn(name = "usuarioId")
    private Usuario avaliador;

    @ManyToOne
    @JoinColumn(name = "pontuacaoId")
    private Pontuacao pontuacao;

    @ManyToOne
    @JoinColumn(name = "inscricaoId")
    private Inscricao inscricao;

    @Column
    private Date dataConclusaoAvaliacao;

    @Column
    private String cursoPretendidoPrimeiraOpcao;

    @Column
    private String cursoPretendidoSegundoOpcao;

    @Column
    private String tipoVaga;

    @Column
    private Boolean documentacaoCompleta;

    @Column
    private String observacoes;

    public Usuario getAvaliador() {
	return avaliador;
    }

    public void setAvaliador(Usuario avaliador) {
	this.avaliador = avaliador;
    }

    public Pontuacao getPontuacao() {
	return pontuacao;
    }

    public void setPontuacao(Pontuacao pontuacao) {
	this.pontuacao = pontuacao;
    }

    public Inscricao getInscricao() {
	return inscricao;
    }

    public void setInscricao(Inscricao inscricao) {
	this.inscricao = inscricao;
    }

    public Date getDataConclusaoAvaliacao() {
	return dataConclusaoAvaliacao;
    }

    public void setDataConclusaoAvaliacao(Date dataConclusaoAvaliacao) {
	this.dataConclusaoAvaliacao = dataConclusaoAvaliacao;
    }

    public String getCursoPretendidoPrimeiraOpcao() {
	return cursoPretendidoPrimeiraOpcao;
    }

    public void setCursoPretendidoPrimeiraOpcao(String cursoPretendidoPrimeiraOpcao) {
	this.cursoPretendidoPrimeiraOpcao = cursoPretendidoPrimeiraOpcao;
    }

    public String getCursoPretendidoSegundoOpcao() {
	return cursoPretendidoSegundoOpcao;
    }

    public void setCursoPretendidoSegundoOpcao(String cursoPretendidoSegundoOpcao) {
	this.cursoPretendidoSegundoOpcao = cursoPretendidoSegundoOpcao;
    }

    public String getTipoVaga() {
	return tipoVaga;
    }

    public void setTipoVaga(String tipoVaga) {
	this.tipoVaga = tipoVaga;
    }

    public Boolean getDocumentacaoCompleta() {
	return documentacaoCompleta;
    }

    public void setDocumentacaoCompleta(Boolean documentacaoCompleta) {
	this.documentacaoCompleta = documentacaoCompleta;
    }

    public String getObservacoes() {
	return observacoes;
    }

    public void setObservacoes(String observacoes) {
	this.observacoes = observacoes;
    }

    public static long getSerialversionuid() {
	return serialVersionUID;
    }

}
