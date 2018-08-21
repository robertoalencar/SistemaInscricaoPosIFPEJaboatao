package main.br.org.ifpe.inscricaopos.dao;

import main.br.org.ifpe.inscricaopos.entidade.Inscricao;
import main.br.org.ifpe.inscricaopos.util.HibernateDao;

/**
 * @author Roberto Alencar
 *
 */
public class InscricaoDao extends HibernateDao {

    public Class<Inscricao> getClassEntidade() {
	return Inscricao.class;
    }
}
