package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;

import lombok.Data;

/**
 * @author Roberto Alencar
 *
 */
@Data
public class InscricoesVO implements Serializable {

    private static final long serialVersionUID = -6223954066885298690L;

    private Inscricao inscricao;
    private int qtdAvaliacoes;
    
}
