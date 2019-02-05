package main.br.org.ifpe.inscricaopos.entidade;

import javax.persistence.Column;
import javax.persistence.Entity;

import main.br.org.ifpe.inscricaopos.util.EntidadeNegocio;

/**
 * @author Roberto Alencar
 *
 */
@Entity
public class TipoUsuario extends EntidadeNegocio {

    private static final long serialVersionUID = -1284581090840186517L;

    @Column
    private String descricao;

    public String getDescricao() {
	return descricao;
    }

    public void setDescricao(String descricao) {
	this.descricao = descricao;
    }

}
