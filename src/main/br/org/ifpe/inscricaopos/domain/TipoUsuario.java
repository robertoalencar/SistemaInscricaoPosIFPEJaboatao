package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;

import javax.persistence.Column;
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
public class TipoUsuario implements Serializable {

    private static final long serialVersionUID = -8638707224905631389L;

    @Id
    @SequenceGenerator(name = "TIPO_USUARIO_SEQUENCE", sequenceName = "tipo_usuario_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "TIPO_USUARIO_SEQUENCE", strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column
    private String descricao;

}
