package main.br.org.ifpe.inscricaopos.dao;

import main.br.org.ifpe.inscricaopos.entidade.Candidato;
import main.br.org.ifpe.inscricaopos.util.HibernateDao;

public class CandidatoDao extends HibernateDao {

    public Class<Candidato> getClassEntidade() {
	return Candidato.class;
    }
}
