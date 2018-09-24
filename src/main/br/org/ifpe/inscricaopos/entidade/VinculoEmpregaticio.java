package main.br.org.ifpe.inscricaopos.entidade;

import java.util.Date;

import main.br.org.ifpe.inscricaopos.util.EntidadeNegocio;

/**
 * @author Roberto Alencar
 *
 */
public class VinculoEmpregaticio extends EntidadeNegocio {

    private static final long serialVersionUID = -3357075447002975502L;
    
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
