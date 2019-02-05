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
public class VinculoEmpregaticio extends EntidadeNegocio {

    private static final long serialVersionUID = -3357075447002975502L;

    @ManyToOne
    @JoinColumn(name = "pontuacaoId")
    private Pontuacao pontuacao;

    @Column
    private Date dataInicio;

    @Column
    private Date dataFim;

    @Column
    private String areaCargo;

    public Pontuacao getPontuacao() {
	return pontuacao;
    }

    public void setPontuacao(Pontuacao pontuacao) {
	this.pontuacao = pontuacao;
    }

    public Date getDataInicio() {
	return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
	this.dataInicio = dataInicio;
    }

    public Date getDataFim() {
	return dataFim;
    }

    public void setDataFim(Date dataFim) {
	this.dataFim = dataFim;
    }

    public String getAreaCargo() {
	return areaCargo;
    }

    public void setAreaCargo(String areaCargo) {
	this.areaCargo = areaCargo;
    }

}
