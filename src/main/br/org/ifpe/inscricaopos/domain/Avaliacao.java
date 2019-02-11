package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

/**
 * @author Roberto Alencar
 *
 */
@Entity
public class Avaliacao implements Serializable {

    private static final long serialVersionUID = 2478626825431942803L;

    @Id
    @SequenceGenerator(name = "AVALIACAO_SEQUENCE", sequenceName = "avaliacao_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "AVALIACAO_SEQUENCE", strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column
    private boolean habilitado;

    @ManyToOne
    private Usuario avaliador;

    @ManyToOne
    private Inscricao inscricao;

    @Column
    private Date dataAvaliacao;

    @Column
    private String tipoVaga;

    @Column
    private Boolean documentacaoCompleta;

    @Column
    private String observacoes;

    @Column
    private Integer qtdCursosGraduacaoComputacao;

    @Column
    private Integer qtdCursosGraduacaoOutras;

    @Column
    private Integer qtdAtigosComputacao;

    @Column
    private Integer qtdAtigosOutras;

    @Column
    private Double mediaGeralHistorico;

    @Column
    private Double fatorCargaHoraria;

    @Column
    private Double notaFinal;

    @OneToMany
    private List<VinculoEmpregaticio> empregos;

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public boolean isHabilitado() {
	return habilitado;
    }

    public void setHabilitado(boolean habilitado) {
	this.habilitado = habilitado;
    }

    public Usuario getAvaliador() {
	return avaliador;
    }

    public void setAvaliador(Usuario avaliador) {
	this.avaliador = avaliador;
    }

    public Inscricao getInscricao() {
	return inscricao;
    }

    public void setInscricao(Inscricao inscricao) {
	this.inscricao = inscricao;
    }

    public Date getDataAvaliacao() {
	return dataAvaliacao;
    }

    public void setDataAvaliacao(Date dataAvaliacao) {
	this.dataAvaliacao = dataAvaliacao;
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

    public List<VinculoEmpregaticio> getEmpregos() {
	return empregos;
    }

    public void setEmpregos(List<VinculoEmpregaticio> empregos) {
	this.empregos = empregos;
    }

}
