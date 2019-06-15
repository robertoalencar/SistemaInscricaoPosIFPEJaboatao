package main.br.org.ifpe.inscricaopos.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import main.br.org.ifpe.inscricaopos.domain.Avaliacao;
import main.br.org.ifpe.inscricaopos.domain.Candidato;
import main.br.org.ifpe.inscricaopos.domain.Inscricao;
import main.br.org.ifpe.inscricaopos.domain.VinculoEmpregaticio;
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

    public Inscricao find(Long id) {

	Inscricao obj = null;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	obj = manager.find(Inscricao.class, id);
	manager.close();
	factory.close();

	return obj;
    }

    public Inscricao save(Inscricao inscricao) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	manager.getTransaction().begin();

	manager.persist(inscricao.getCandidato());
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
	Query query = manager.createQuery("FROM Avaliacao a WHERE a.inscricao.id = :paramIdInscricao");
	query.setParameter("paramIdInscricao", id);
	List<Avaliacao> avaliacoes = query.getResultList();

	manager.getTransaction().begin();

	// Remove as avaliações associadas:
	for (Avaliacao avaliacao : avaliacoes) {

	    for (VinculoEmpregaticio emprego : avaliacao.getEmpregos()) {
		manager.remove(emprego);
	    }

	    manager.remove(avaliacao);
	}

	// Remove a inscrição
	manager.remove(inscricao);

	// Remove o candidato
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

    public List<Inscricao> listar() {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = manager.createQuery("FROM Inscricao ORDER BY id DESC");
	List<Inscricao> lista = query.getResultList();

	manager.close();
	factory.close();

	return lista;
    }

    public List<Inscricao> filtrar(Integer numInscricao, String nome) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = null;

	if (numInscricao != null && (nome == null || nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT i FROM Inscricao i, Candidato c WHERE i.candidato.id = c.id AND i.numero = :paramNumInscricao ORDER BY c.nome");
	    query.setParameter("paramNumInscricao", numInscricao);
	} else if (numInscricao == null && (nome != null && !nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT i FROM Inscricao i, Candidato c WHERE i.candidato.id = c.id AND c.nome like :paramNome ORDER BY c.nome");
	    query.setParameter("paramNome", "%" + nome + "%");
	} else if (numInscricao != null && (nome != null && !nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT i FROM Inscricao i, Candidato c WHERE i.candidato.id = c.id AND i.numero = :paramNumInscricao AND c.nome like :paramNome ORDER BY c.nome");
	    query.setParameter("paramNumInscricao", numInscricao);
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

    public Long listarQuantidadeInscricao() {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = manager.createQuery("SELECT count(i) FROM Inscricao i");
	Long quantidadeAvaliacoes = (Long) query.getSingleResult();
	manager.close();
	factory.close();

	return quantidadeAvaliacoes;
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

    public boolean verificaDuplicidadeCpfCandidato(Candidato candidato) {

	boolean existeCpf = false;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	Query query = manager.createQuery("SELECT c.nome FROM Candidato c WHERE c.cpf = :paramCpf");
	query.setParameter("paramCpf", candidato.getCpf());

	List<String> candidatos = query.getResultList();

	if (candidatos != null && !candidatos.isEmpty()) {
	    existeCpf = true;
	}

	manager.close();
	factory.close();

	return existeCpf;
    }

}
