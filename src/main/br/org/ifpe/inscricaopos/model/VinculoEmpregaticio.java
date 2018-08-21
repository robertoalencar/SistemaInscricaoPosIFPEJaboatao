package main.br.org.ifpe.inscricaopos.model;

import java.util.Date;

/**
 * @author Roberto Alencar
 *
 */
public class VinculoEmpregaticio extends EntidadeNegocio {

    private Pontuacao pontuacao;
    private Date dataInicio;
    private Date dataFim;
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
