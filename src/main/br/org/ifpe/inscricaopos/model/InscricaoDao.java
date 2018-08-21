package main.br.org.ifpe.inscricaopos.model;

/**
 * @author Roberto Alencar
 *
 */
public class InscricaoDao extends HibernateDao {

    public Class<Inscricao> getClassEntidade() {
	return Inscricao.class;
    }
}
