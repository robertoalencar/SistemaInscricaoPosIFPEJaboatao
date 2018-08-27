package main.br.org.ifpe.inscricaopos.dao;

import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import main.br.org.ifpe.inscricaopos.entidade.Candidato;
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

    public String salvarInscricao(Candidato candidato) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	manager.getTransaction().begin();

	candidato.setHabilitado(Boolean.TRUE);
	manager.persist(candidato);

	Inscricao inscricao = new Inscricao();
	inscricao.setNumero(gerarNumeroInscricao());
	inscricao.setCandidato(candidato);
	inscricao.setHabilitado(Boolean.TRUE);
	inscricao.setDataInscricao(Calendar.getInstance().getTime());
	manager.persist(inscricao);

	manager.getTransaction().commit();
	manager.close();
	factory.close();

	return inscricao.getNumero();
    }

    public List<Inscricao> listar() {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = manager.createQuery("FROM Inscricao ORDER BY numero");
	List<Inscricao> lista = query.getResultList();
	manager.close();
	factory.close();

	return lista;
    }

    private String gerarNumeroInscricao() {

	Calendar c = Calendar.getInstance();

	int ano = c.get(Calendar.YEAR);
	int mes = c.get(Calendar.MONTH);
	int dia = c.get(Calendar.DAY_OF_MONTH);
	int hora = c.get(Calendar.HOUR_OF_DAY);
	int minuto = c.get(Calendar.MINUTE);
	int segundo = c.get(Calendar.SECOND);

	return ano + "." + (mes + 1) + "." + dia + "-" + hora + minuto + segundo;
    }
}
