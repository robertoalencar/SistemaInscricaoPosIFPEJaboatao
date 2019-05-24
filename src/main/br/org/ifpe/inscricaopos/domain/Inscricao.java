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

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Roberto Alencar
 *
 */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class Inscricao implements Serializable {

    private static final long serialVersionUID = -1781786170928437751L;

    @Id
    @SequenceGenerator(name = "INSCRICAO_SEQUENCE", sequenceName = "inscricao_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "INSCRICAO_SEQUENCE", strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column
    private boolean habilitado;

    @ManyToOne(fetch = FetchType.EAGER)
    private Candidato candidato;

    @OneToMany(fetch = FetchType.EAGER) 
    private List<Avaliacao> avaliacoes;

    @Column
    private String avaliadorAlocado;
    
    @Column
    private String numero;

    @Column
    private String cursoEscolhido;

    @Column
    private Integer classificacao;

    @Column
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dataInscricao;

}
