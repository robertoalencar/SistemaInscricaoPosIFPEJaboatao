package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;

import lombok.Data;

/**
 * @author Roberto Alencar
 *
 */
@Data
public class InscricoesVO implements Serializable {

    public static final String STATUS_INSCRICAO_APROVADA = "Aprovada";
    public static final String STATUS_INSCRICAO_PENDENTE = "Pendente";
    
    private static final long serialVersionUID = -6223954066885298690L;

    private Inscricao inscricao;
    private String status;
    private int qtdAvaliacoes;
    
}
