package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author Roberto Alencar
 *
 */
@Entity
public class Inscricao implements Serializable {

    private static final long serialVersionUID = -1781786170928437751L;

    @Id
    @SequenceGenerator(name = "INSCRICAO_SEQUENCE", sequenceName = "inscricao_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "INSCRICAO_SEQUENCE", strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column
    private boolean habilitado;

    @ManyToOne
    private Candidato candidato;

    @OneToMany(fetch = FetchType.EAGER)
    private List<Avaliacao> avaliacoes;

    @Column
    private String numero;

    @Column
    private String cursoEscolhido;

    @Column
    private Integer classificacao;

    @Column
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dataInscricao;

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

    public String getNumero() {
	return numero;
    }

    public void setNumero(String numero) {
	this.numero = numero;
    }

    public String getCursoEscolhido() {
	return cursoEscolhido;
    }

    public void setCursoEscolhido(String cursoEscolhido) {
	this.cursoEscolhido = cursoEscolhido;
    }

    public Integer getClassificacao() {
	return classificacao;
    }

    public void setClassificacao(Integer classificacao) {
	this.classificacao = classificacao;
    }

    public Date getDataInscricao() {
	return dataInscricao;
    }

    public void setDataInscricao(Date dataInscricao) {
	this.dataInscricao = dataInscricao;
    }

}
