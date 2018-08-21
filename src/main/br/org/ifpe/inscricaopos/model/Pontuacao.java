package main.br.org.ifpe.inscricaopos.model;

import java.util.List;

/**
 * @author Roberto Alencar
 *
 */
public class Pontuacao extends EntidadeNegocio {

    private Integer qtdCursosGraduacaoComputacao;
    private Integer qtdCursosGraduacaoOutras;
    private Integer qtdAtigosComputacao;
    private Integer qtdAtigosOutras;
    private List<VinculoEmpregaticio> empregos;
    private Double mediaGeralHistorico;
    private Double fatorCargaHoraria;
    private Double notaFinal;

    public Integer getQtdCursosGraduacaoComputacao() {
	return qtdCursosGraduacaoComputacao;
    }

    public void setQtdCursosGraduacaoComputacao(Integer qtdCursosGraduacaoComputacao) {
	this.qtdCursosGraduacaoComputacao = qtdCursosGraduacaoComputacao;
    }

    public Integer getQtdCursosGraduacaoOutras() {
	return qtdCursosGraduacaoOutras;
    }

    public void setQtdCursosGraduacaoOutras(Integer qtdCursosGraduacaoOutras) {
	this.qtdCursosGraduacaoOutras = qtdCursosGraduacaoOutras;
    }

    public Integer getQtdAtigosComputacao() {
	return qtdAtigosComputacao;
    }

    public void setQtdAtigosComputacao(Integer qtdAtigosComputacao) {
	this.qtdAtigosComputacao = qtdAtigosComputacao;
    }

    public Integer getQtdAtigosOutras() {
	return qtdAtigosOutras;
    }

    public void setQtdAtigosOutras(Integer qtdAtigosOutras) {
	this.qtdAtigosOutras = qtdAtigosOutras;
    }

    public List<VinculoEmpregaticio> getEmpregos() {
	return empregos;
    }

    public void setEmpregos(List<VinculoEmpregaticio> empregos) {
	this.empregos = empregos;
    }

    public Double getMediaGeralHistorico() {
	return mediaGeralHistorico;
    }

    public void setMediaGeralHistorico(Double mediaGeralHistorico) {
	this.mediaGeralHistorico = mediaGeralHistorico;
    }

    public Double getFatorCargaHoraria() {
	return fatorCargaHoraria;
    }

    public void setFatorCargaHoraria(Double fatorCargaHoraria) {
	this.fatorCargaHoraria = fatorCargaHoraria;
    }

    public Double getNotaFinal() {
	return notaFinal;
    }

    public void setNotaFinal(Double notaFinal) {
	this.notaFinal = notaFinal;
    }

}
