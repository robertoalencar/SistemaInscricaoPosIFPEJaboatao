package main.br.org.ifpe.inscricaopos.model;

public class CandidatoDao extends HibernateDao {

    public Class<Candidato> getClassEntidade() {
	return Candidato.class;
    }
}
