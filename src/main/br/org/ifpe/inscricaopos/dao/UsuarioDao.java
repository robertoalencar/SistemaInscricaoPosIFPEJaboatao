package main.br.org.ifpe.inscricaopos.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import main.br.org.ifpe.inscricaopos.domain.TipoUsuario;
import main.br.org.ifpe.inscricaopos.domain.Usuario;
import main.br.org.ifpe.inscricaopos.util.HibernateDao;

@Repository
public class UsuarioDao extends HibernateDao {

    public Class<Usuario> getClassEntidade() {
	return Usuario.class;
    }

    public Usuario find(Long id) {

	Usuario usuario = null;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	usuario = manager.find(Usuario.class, id);
	usuario.setTipo(manager.find(TipoUsuario.class, usuario.getTipo().getId()));
	manager.close();
	factory.close();

	return usuario;
    }

    public TipoUsuario findTipoUsuario(Long id) {

	TipoUsuario obj = null;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	obj = manager.find(TipoUsuario.class, id);
	manager.close();
	factory.close();

	return obj;
    }

    public List<Usuario> list(String criterioOrdenacao, String ordem) {

	criterioOrdenacao = (criterioOrdenacao == null) ? "id" : criterioOrdenacao;
	ordem = (ordem == null) ? "ASC" : ordem;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = manager
		.createQuery("FROM Usuario u JOIN FETCH u.tipo ORDER BY u." + criterioOrdenacao + " " + ordem);
	List<Usuario> lista = query.getResultList();
	manager.close();
	factory.close();

	return lista;
    }

    public List<TipoUsuario> listarTipoUsuario(String criterioOrdenacao, String ordem) {

	criterioOrdenacao = (criterioOrdenacao == null) ? "id" : criterioOrdenacao;
	ordem = (ordem == null) ? "ASC" : ordem;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = manager.createQuery("FROM TipoUsuario t ORDER BY " + criterioOrdenacao + " " + ordem);
	List<TipoUsuario> lista = query.getResultList();
	manager.close();
	factory.close();

	return lista;
    }

    public List<Usuario> filtrar(Long tipoUsuarioId, String nome) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = null;

	if ((tipoUsuarioId != null && tipoUsuarioId != 0) && (nome == null || nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT u FROM Usuario u JOIN FETCH u.tipo, TipoUsuario t WHERE u.tipo.id = t.id AND t.id = :paramTipoUsuarioId ORDER BY u.nome");
	    query.setParameter("paramTipoUsuarioId", tipoUsuarioId);
	} else if ((tipoUsuarioId == null || tipoUsuarioId == 0) && (nome != null && !nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT u FROM Usuario u JOIN FETCH u.tipo, TipoUsuario t WHERE u.tipo.id = t.id AND u.nome LIKE :paramNome ORDER BY u.nome");
	    query.setParameter("paramNome", "%" + nome + "%");
	} else if ((tipoUsuarioId != null && tipoUsuarioId != 0) && (nome != null && !nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT u FROM Usuario u JOIN FETCH u.tipo, TipoUsuario t WHERE u.tipo.id = t.id AND t.id = :paramTipoUsuarioId AND u.nome LIKE :paramNome ORDER BY u.nome");
	    query.setParameter("paramTipoUsuarioId", tipoUsuarioId);
	    query.setParameter("paramNome", "%" + nome + "%");
	} else {
	    query = manager.createQuery("FROM Usuario u JOIN FETCH u.tipo ORDER BY u.nome");
	}

	List<Usuario> lista = query.getResultList();

	manager.close();
	factory.close();

	return lista;
    }

    public Usuario buscarUsuario(Usuario usuario) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	Query query = manager.createQuery(
		"FROM Usuario u JOIN FETCH u.tipo WHERE u.siape LIKE :paramSiape AND u.senha LIKE :paramSenha");
	query.setParameter("paramSiape", usuario.getSiape().trim());
	query.setParameter("paramSenha", usuario.getSenha().trim());

	Usuario obj = null;

	try {
	    obj = (Usuario) query.getSingleResult();
	} catch (NoResultException e) {
	    obj = null;
	}

	manager.close();
	factory.close();

	return obj;
    }

}
