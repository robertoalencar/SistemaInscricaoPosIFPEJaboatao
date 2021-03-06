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

import lombok.Data;

/**
 * @author Roberto Alencar
 *
 */
@Data
@Entity
public class Avaliacao implements Serializable {

    private static final long serialVersionUID = 2478626825431942803L;

    @Id
    @SequenceGenerator(name = "AVALIACAO_SEQUENCE", sequenceName = "avaliacao_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "AVALIACAO_SEQUENCE", strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column
    private boolean aprovada;

    @ManyToOne(fetch = FetchType.LAZY)
    private Usuario avaliador;

    @ManyToOne(fetch = FetchType.LAZY)
    private Inscricao inscricao;

    @Column
    private Date dataAvaliacao;

    @Column
    private String tipoVaga;

    @Column
    private boolean documentacaoCompleta;

    @Column(length = 10000)
    private String observacoes;

    @Column
    private Integer gradQtdCursosComputacao;

    @Column
    private Integer gradQtdCursosOutros;

    @Column
    private Double gradPontuacaoTotal;

    @Column
    private Double gradPontuacaoItem;

    @Column
    private Integer qtdAtigosComputacao;

    @Column
    private Integer qtdAtigosOutras;

    @Column
    private Double prodCientificaPontuacaoTotal;

    @Column
    private Double prodCientificaPontuacaoItem;

    @OneToMany(fetch = FetchType.LAZY) 
    private List<VinculoEmpregaticio> empregos;
    
    @Column 
    private int quantidadeVinculosEmpregaticios;
    
    @Column
    private Double expProfTotalMesesAreaComp;
    
    @Column
    private Double expProfTotalMesesOutras;
    
    @Column
    private Double expProfPontuacaoTotal;

    @Column
    private Double expProfPontuacaoItem;

    @Column
    private Double historicoMediaGeral;

    @Column
    private Double historicoFatorCargaHoraria;

    @Column
    private Double historicoPontuacaoTotal;

    @Column
    private Double historicoPontuacaoItem;

    @Column
    private Double notaFinal;

}
