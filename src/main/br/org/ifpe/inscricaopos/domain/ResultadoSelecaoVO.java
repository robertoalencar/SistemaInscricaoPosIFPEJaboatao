package main.br.org.ifpe.inscricaopos.domain;

import java.io.Serializable;

import lombok.Data;

/**
 * @author Roberto Alencar
 *
 */
@Data
public class ResultadoSelecaoVO implements Serializable {

    private static final long serialVersionUID = -9148776616881273111L;

    private Inscricao inscricao;
    private Double notaCandidato;

}
