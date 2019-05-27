package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;

import lombok.Data;

/**
 * @author Roberto Alencar
 *
 */
@Data
public class AvaliacaoVO implements Serializable {

    private static final long serialVersionUID = -6518478767728327025L;

    private Long idInscricao;

    private Boolean documentacaoCompleta;
    private Double notaFinal;
    private String tipoVaga;
    private String observacoes;

    private Integer gradQtdCursosComputacao;
    private Integer gradQtdCursosOutros;
    private Double gradPontuacaoTotal;
    private Double gradPontuacaoItem;

    private Integer qtdAtigosComputacao;
    private Integer qtdAtigosOutras;
    private Double prodCientificaPontuacaoTotal;
    private Double prodCientificaPontuacaoItem;

    private String[] areaCargo;
    private String[] dataInicio;
    private String[] dataFim;
    private String[] totalMeses;

    private Double expProfTotalMesesAreaComp;
    private Double expProfTotalMesesOutras;
    private Double expProfPontuacaoTotal;
    private Double expProfPontuacaoItem;

    private Double historicoMediaGeral;
    private Double historicoFatorCargaHoraria;
    private Double historicoPontuacaoTotal;
    private Double historicoPontuacaoItem;

}
