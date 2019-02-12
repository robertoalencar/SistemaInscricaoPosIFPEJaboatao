package main.br.org.ifpe.inscricaopos.dao;

import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import main.br.org.ifpe.inscricaopos.domain.Candidato;
import main.br.org.ifpe.inscricaopos.domain.Inscricao;
import main.br.org.ifpe.inscricaopos.util.HibernateDao;

/**
 * @author Roberto Alencar
 *
 */
@Repository
public class InscricaoDao extends HibernateDao {

    public Class<Inscricao> getClassEntidade() {
	return Inscricao.class;
    }

    public Inscricao save(Candidato candidato, String cursoEscolhido) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	manager.getTransaction().begin();

	candidato.setHabilitado(Boolean.TRUE);
	manager.persist(candidato);

	Inscricao inscricao = Inscricao.builder()
		.numero(gerarNumeroInscricao())
		.candidato(candidato)
		.cursoEscolhido(cursoEscolhido)
		.habilitado(Boolean.TRUE)
		.dataInscricao(Calendar.getInstance().getTime())
		.build();

	manager.persist(inscricao);

	manager.getTransaction().commit();
	manager.close();
	factory.close();

	return inscricao;
    }

    public Object update(Candidato candidato, Inscricao inscricao) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();
	manager.merge(inscricao);
	manager.merge(candidato);
	manager.getTransaction().commit();

	manager.close();
	factory.close();

	return candidato;
    }

    public void remove(Long id) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Inscricao inscricao = manager.find(getClassEntidade(), id);
	Candidato candidato = manager.find(Candidato.class, inscricao.getCandidato().getId());

	manager.getTransaction().begin();
	manager.remove(inscricao);
	manager.remove(candidato);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

    public List<Inscricao> listar(String criterioOrdenacao, String ordem) {

	criterioOrdenacao = (criterioOrdenacao == null) ? "classificacao" : criterioOrdenacao;
	ordem = (ordem == null) ? "ASC" : ordem;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = manager.createQuery("SELECT i FROM Inscricao i, Candidato c WHERE i.candidato.id = c.id ORDER BY "
		+ criterioOrdenacao + " " + ordem);
	List<Inscricao> lista = query.getResultList();
	manager.close();
	factory.close();

	return lista;
    }

    public List<Inscricao> filtrar(String numInscricao, String nome) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = null;

	if ((numInscricao != null && !numInscricao.equals("")) && (nome == null || nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT i FROM Inscricao i, Candidato c WHERE i.candidato.id = c.id AND i.numero like :paramNumInscricao ORDER BY c.nome");
	    query.setParameter("paramNumInscricao", "%" + numInscricao + "%");
	} else if ((numInscricao == null || numInscricao.equals("")) && (nome != null && !nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT i FROM Inscricao i, Candidato c WHERE i.candidato.id = c.id AND c.nome like :paramNome ORDER BY c.nome");
	    query.setParameter("paramNome", "%" + nome + "%");
	} else if ((numInscricao != null && !numInscricao.equals("")) && (nome != null && !nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT i FROM Inscricao i, Candidato c WHERE i.candidato.id = c.id AND i.numero like :paramNumInscricao AND c.nome like :paramNome ORDER BY c.nome");
	    query.setParameter("paramNumInscricao", "%" + numInscricao + "%");
	    query.setParameter("paramNome", "%" + nome + "%");
	} else {
	    query = manager
		    .createQuery("SELECT i FROM Inscricao i, Candidato c WHERE i.candidato.id = c.id ORDER BY c.nome");
	}

	List<Inscricao> lista = query.getResultList();

	manager.close();
	factory.close();

	return lista;
    }

    public Inscricao obterInscricaoCandidato(Long id) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	Query query = manager.createQuery("FROM Inscricao WHERE candidato.id = :paramIdCandidato");
	query.setParameter("paramIdCandidato", id);
	Inscricao inscricao = (Inscricao) query.getSingleResult();

	manager.close();
	factory.close();

	return inscricao;
    }

    private String gerarNumeroInscricao() {

	Calendar c = Calendar.getInstance();

	int ano = c.get(Calendar.YEAR);
	int mes = c.get(Calendar.MONTH);
	int dia = c.get(Calendar.DAY_OF_MONTH);
	int hora = c.get(Calendar.HOUR_OF_DAY);
	int minuto = c.get(Calendar.MINUTE);
	int segundo = c.get(Calendar.SECOND);

	return (String.valueOf(ano)).substring(2, 4) + (mes + 1) + dia + "-" + hora + minuto + segundo;
    }
}
