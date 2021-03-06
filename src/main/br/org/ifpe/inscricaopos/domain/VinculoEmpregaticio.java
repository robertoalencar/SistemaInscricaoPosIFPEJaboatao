package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
 * @author Roberto Alencar
 *
 */
@Data
@Entity
public class VinculoEmpregaticio implements Serializable {

    public static final String VINCULO_AREA_COMPUTACAO = "computacao";
    public static final String VINCULO_AREA_OUTRAS = "outras";
    
    private static final long serialVersionUID = 5148506936140358620L;

    @Id
    @SequenceGenerator(name = "VINCULO_EMPREGATICIO_SEQUENCE", sequenceName = "Vinculo_empregaticio_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "VINCULO_EMPREGATICIO_SEQUENCE", strategy = GenerationType.SEQUENCE)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    private Avaliacao avaliacao;

    @Column
    private String areaCargo;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column
    private Date dataInicio;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column
    private Date dataFim;

    @Column
    private Double totalMeses;

}
