package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
 * @author Roberto Alencar
 *
 */
@Data
@Entity
public class Candidato implements Serializable {

    private static final long serialVersionUID = -6657633521233266286L;

    @Id
    @SequenceGenerator(name = "CANDIDATO_SEQUENCE", sequenceName = "candidato_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "CANDIDATO_SEQUENCE", strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column
    private boolean habilitado;

    @Column
    private String nome;

    @Column
    private String cpf;

    @Column
    private String sexo;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column
    private Date dataNacimento;

    @Column(name = "email")
    private String email;

    @Column
    private String foneResidencial;

    @Column
    private String foneCelular;

}
