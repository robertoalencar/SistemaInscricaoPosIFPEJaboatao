package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.Data;

/**
 * @author Roberto Alencar
 *
 */
@Data
@Entity
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1992758835748163813L;

    @Id
    @SequenceGenerator(name = "USUARIO_SEQUENCE", sequenceName = "usuario_id_seq ", allocationSize = 1, initialValue = 1)
    @GeneratedValue(generator = "USUARIO_SEQUENCE", strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column
    private boolean habilitado;

    @ManyToOne
    private TipoUsuario tipo;

    @Column
    private String nome;

    @Column
    private String siape;

    @Column
    private String login;

    @Column
    private String senha;

    @Column
    private String fone;

    @Column
    private String email;

}
