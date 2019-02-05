package main.br.org.ifpe.inscricaopos.entidade;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

import main.br.org.ifpe.inscricaopos.util.EntidadeNegocio;

/**
 * @author Roberto Alencar
 *
 */
@Entity
public class Pontuacao extends EntidadeNegocio {

    private static final long serialVersionUID = 2978299529103699406L;

    @Column
    private Integer qtdCursosGraduacaoComputacao;

    @Column
    private Integer qtdCursosGraduacaoOutras;

    @Column
    private Integer qtdAtigosComputacao;

    @Column
    private Integer qtdAtigosOutras;

    @OneToMany
    private List<VinculoEmpregaticio> empregos;

    @Column
    private Double mediaGeralHistorico;

    @Column
    private Double fatorCargaHoraria;

    @Column
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
