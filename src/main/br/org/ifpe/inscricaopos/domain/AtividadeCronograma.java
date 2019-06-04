package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.Data;

/**
 * @author Roberto Alencar
 *
 */
@Data
@Entity
public class AtividadeCronograma implements Serializable {

    private static final long serialVersionUID = -1986025810881246776L;

    @Id
    @SequenceGenerator(name = "ATIVIDADE_CRONOGRAMA_SEQUENCE", sequenceName = "atividade_cronograma_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "ATIVIDADE_CRONOGRAMA_SEQUENCE", strategy = GenerationType.SEQUENCE)
    private Long id;

    private String atividade;

    private String periodo;

    private String status;

}
