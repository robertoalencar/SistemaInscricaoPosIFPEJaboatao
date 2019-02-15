package main.br.org.ifpe.inscricaopos.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import main.br.org.ifpe.inscricaopos.domain.Usuario;
import main.br.org.ifpe.inscricaopos.util.HibernateDao;

@Repository
public class UsuarioDao extends HibernateDao {

    public Class<Usuario> getClassEntidade() {
	return Usuario.class;
    }

    public List<Usuario> filtrar(Long tipoUsuarioId, String nome) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = null;

	if ((tipoUsuarioId != null && tipoUsuarioId != 0) && (nome == null || nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT u FROM Usuario u, TipoUsuario t WHERE u.tipo.id = t.id AND t.id = :paramTipoUsuarioId ORDER BY u.nome");
	    query.setParameter("paramTipoUsuarioId", tipoUsuarioId);
	} else if ((tipoUsuarioId == null || tipoUsuarioId == 0) && (nome != null && !nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT u FROM Usuario u, TipoUsuario t WHERE u.tipo.id = t.id AND u.nome LIKE :paramNome ORDER BY u.nome");
	    query.setParameter("paramNome", "%" + nome + "%");
	} else if ((tipoUsuarioId != null && tipoUsuarioId != 0) && (nome != null && !nome.equals(""))) {
	    query = manager.createQuery(
		    "SELECT u FROM Usuario u, TipoUsuario t WHERE u.tipo.id = t.id AND t.id = :paramTipoUsuarioId AND u.nome LIKE :paramNome ORDER BY u.nome");
	    query.setParameter("paramTipoUsuarioId", tipoUsuarioId);
	    query.setParameter("paramNome", "%" + nome + "%");
	} else {
	    query = manager.createQuery("FROM Usuario ORDER BY nome");
	}

	List<Usuario> lista = query.getResultList();

	manager.close();
	factory.close();

	return lista;
    }

    public Usuario buscarUsuario(Usuario usuario) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	Query query = manager.createQuery("FROM Usuario WHERE siape LIKE :paramSiape AND senha LIKE :paramSenha");
	query.setParameter("paramSiape", usuario.getSiape().trim());
	query.setParameter("paramSenha", usuario.getSenha().trim());

	List<?> retorno = query.getResultList();

	Usuario obj = null;
	if (retorno != null && retorno.size() != 0) {
	    obj = (Usuario) retorno.get(0);
	}

	manager.close();
	factory.close();

	return obj;
    }

}
