package main.br.org.ifpe.inscricaopos.entidade;

import java.util.Date;

import main.br.org.ifpe.inscricaopos.util.EntidadeNegocio;

/**
 * @author Roberto Alencar
 *
 */
public class Avaliacao extends EntidadeNegocio {

    private Usuario avaliador;
    private Date dataConclusaoAvaliacao;
    private Integer cursoPretendidoPrimeiraOpcao;
    private Integer cursoPretendidoSegundoOpcao;
    private String tipoVaga;
    private Boolean documentacaoCompleta;
    private Pontuacao pontuacao;
    private String observacoes;

    public Usuario getAvaliador() {
	return avaliador;
    }

    public void setAvaliador(Usuario avaliador) {
	this.avaliador = avaliador;
    }

    public Date getDataConclusaoAvaliacao() {
	return dataConclusaoAvaliacao;
    }

    public void setDataConclusaoAvaliacao(Date dataConclusaoAvaliacao) {
	this.dataConclusaoAvaliacao = dataConclusaoAvaliacao;
    }

    public Integer getCursoPretendidoPrimeiraOpcao() {
	return cursoPretendidoPrimeiraOpcao;
    }

    public void setCursoPretendidoPrimeiraOpcao(Integer cursoPretendidoPrimeiraOpcao) {
	this.cursoPretendidoPrimeiraOpcao = cursoPretendidoPrimeiraOpcao;
    }

    public Integer getCursoPretendidoSegundoOpcao() {
	return cursoPretendidoSegundoOpcao;
    }

    public void setCursoPretendidoSegundoOpcao(Integer cursoPretendidoSegundoOpcao) {
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

    public Pontuacao getPontuacao() {
	return pontuacao;
    }

    public void setPontuacao(Pontuacao pontuacao) {
	this.pontuacao = pontuacao;
    }

    public String getObservacoes() {
	return observacoes;
    }

    public void setObservacoes(String observacoes) {
	this.observacoes = observacoes;
    }

}
