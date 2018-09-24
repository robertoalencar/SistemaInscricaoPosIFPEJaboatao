package main.br.org.ifpe.inscricaopos.entidade;

import main.br.org.ifpe.inscricaopos.util.EntidadeNegocio;

/**
 * @author Roberto Alencar
 *
 */
public class TipoUsuario extends EntidadeNegocio {

    private static final long serialVersionUID = -1284581090840186517L;
    
    private String descricao;

    public String getDescricao() {
	return descricao;
    }

    public void setDescricao(String descricao) {
	this.descricao = descricao;
    }

}
