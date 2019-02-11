package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

/**
 * @author Roberto Alencar
 *
 */
@Entity
public class VinculoEmpregaticio implements Serializable {

    private static final long serialVersionUID = 5148506936140358620L;

    @Id
    @SequenceGenerator(name = "VINCULO_EMPREGATICIO_SEQUENCE", sequenceName = "Vinculo_empregaticio_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "VINCULO_EMPREGATICIO_SEQUENCE", strategy = GenerationType.SEQUENCE)

    private Long id;

    @Column
    private boolean habilitado;

    @ManyToOne
    private Avaliacao avaliacao;

    @Column
    private Date dataInicio;

    @Column
    private Date dataFim;

    @Column
    private String areaCargo;

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

    public Avaliacao getAvaliacao() {
	return avaliacao;
    }

    public void setAvaliacao(Avaliacao avaliacao) {
	this.avaliacao = avaliacao;
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
