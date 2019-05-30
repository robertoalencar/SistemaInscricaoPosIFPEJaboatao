package main.br.org.ifpe.inscricaopos.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import main.br.org.ifpe.inscricaopos.domain.Avaliacao;
import main.br.org.ifpe.inscricaopos.domain.AvaliacaoVO;
import main.br.org.ifpe.inscricaopos.domain.Inscricao;
import main.br.org.ifpe.inscricaopos.domain.Usuario;
import main.br.org.ifpe.inscricaopos.domain.VinculoEmpregaticio;
import main.br.org.ifpe.inscricaopos.util.HibernateDao;
import main.br.org.ifpe.inscricaopos.util.Util;

@Repository
public class AvaliacaoDao extends HibernateDao {

    public Class<Avaliacao> getClassEntidade() {
	return Avaliacao.class;
    }

    public Avaliacao find(Long id) {

	Avaliacao avaliacao = null;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	avaliacao = manager.find(Avaliacao.class, id);
	avaliacao.setInscricao(manager.find(Inscricao.class, avaliacao.getInscricao().getId()));
	manager.close();
	factory.close();

	return avaliacao;
    }

    public Avaliacao save(AvaliacaoVO avaliacaoVO, Usuario avaliador) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	manager.getTransaction().begin();

	Inscricao inscricao = manager.find(Inscricao.class, avaliacaoVO.getIdInscricao());

	Avaliacao avaliacao = new Avaliacao();
	avaliacao.setAvaliador(manager.find(Usuario.class, avaliador.getId()));
	avaliacao.setInscricao(inscricao);
	avaliacao.setDataAvaliacao(Calendar.getInstance().getTime());

	avaliacao.setTipoVaga(avaliacaoVO.getTipoVaga());
	avaliacao.setDocumentacaoCompleta(avaliacaoVO.getDocumentacaoCompleta());
	avaliacao.setObservacoes(avaliacaoVO.getObservacoes());

	avaliacao.setGradQtdCursosComputacao(avaliacaoVO.getGradQtdCursosComputacao());
	avaliacao.setGradQtdCursosOutros(avaliacaoVO.getGradQtdCursosOutros());
	avaliacao.setGradPontuacaoTotal(avaliacaoVO.getGradPontuacaoTotal());
	avaliacao.setGradPontuacaoItem(avaliacaoVO.getGradPontuacaoItem());

	avaliacao.setQtdAtigosComputacao(avaliacaoVO.getQtdAtigosComputacao());
	avaliacao.setQtdAtigosOutras(avaliacaoVO.getQtdAtigosOutras());
	avaliacao.setProdCientificaPontuacaoTotal(avaliacaoVO.getProdCientificaPontuacaoTotal());
	avaliacao.setProdCientificaPontuacaoItem(avaliacaoVO.getProdCientificaPontuacaoItem());

	avaliacao.setExpProfTotalMesesAreaComp(avaliacaoVO.getExpProfTotalMesesAreaComp());
	avaliacao.setExpProfTotalMesesOutras(avaliacaoVO.getExpProfTotalMesesOutras());
	avaliacao.setExpProfPontuacaoTotal(avaliacaoVO.getExpProfPontuacaoTotal());
	avaliacao.setExpProfPontuacaoItem(avaliacaoVO.getExpProfPontuacaoItem());

	avaliacao.setHistoricoMediaGeral(avaliacaoVO.getHistoricoMediaGeral());
	avaliacao.setHistoricoFatorCargaHoraria(avaliacaoVO.getHistoricoFatorCargaHoraria());
	avaliacao.setHistoricoPontuacaoTotal(avaliacaoVO.getHistoricoPontuacaoTotal());
	avaliacao.setHistoricoPontuacaoItem(avaliacaoVO.getHistoricoPontuacaoItem());
	avaliacao.setNotaFinal(avaliacaoVO.getNotaFinal());

	manager.persist(avaliacao);

	avaliacao.setEmpregos(montarListaEmpregos(avaliacaoVO, avaliacao));
	avaliacao.setQuantidadeVinculosEmpregaticios(avaliacao.getEmpregos().size());
	
	for (VinculoEmpregaticio emprego : avaliacao.getEmpregos()) {
	    manager.persist(emprego);
	}

	manager.merge(avaliacao);

	inscricao.setQtdAvaliacoes(inscricao.getQtdAvaliacoes() + 1);
	manager.merge(inscricao);

	manager.getTransaction().commit();
	manager.close();
	factory.close();

	return avaliacao;
    }

    public void aprovarAvaliacao(Avaliacao avaliacao) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	manager.getTransaction().begin();

	Query query = manager.createQuery(
		"SELECT a FROM Avaliacao a JOIN FETCH a.inscricao, Inscricao i WHERE a.inscricao.id = i.id AND a.inscricao.id = :paramIdInscricao");
	query.setParameter("paramIdInscricao", avaliacao.getInscricao().getId());
	List<Avaliacao> listaAvaliacao = query.getResultList();
	for (Avaliacao a : listaAvaliacao) {
	    a.setAprovada(false);
	    manager.merge(a);
	}

	manager.merge(avaliacao);

	Inscricao inscricao = manager.find(Inscricao.class, avaliacao.getInscricao().getId());
	inscricao.setStatus(Inscricao.STATUS_INSCRICAO_APROVADA);
	manager.merge(inscricao);

	manager.getTransaction().commit();
	manager.close();
	factory.close();
    }

    public List<Avaliacao> listar(Long idInscricao, Long idUsuario) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query;

	if (idInscricao != null && idUsuario == null) {

	    query = manager.createQuery(
		    "SELECT a FROM Avaliacao a JOIN FETCH a.inscricao JOIN FETCH a.avaliador, Inscricao i WHERE a.inscricao.id = i.id AND i.id = :paramIdInscricao ORDER BY a.dataAvaliacao ");
	    query.setParameter("paramIdInscricao", idInscricao);

	} else {

	    query = manager.createQuery("SELECT a FROM Avaliacao a WHERE a.avaliador.id = :paramIdUsuario ");
	    query.setParameter("paramIdUsuario", idUsuario);
	}

	List<Avaliacao> lista = query.getResultList();
	manager.close();
	factory.close();

	return lista;
    }

    public List<VinculoEmpregaticio> listarVinculosEmpregaticios(Long idAvaliacao) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = manager
		.createQuery("SELECT v FROM VinculoEmpregaticio v WHERE v.avaliacao.id = :paramIdAvaliacao ");
	query.setParameter("paramIdAvaliacao", idAvaliacao);

	List<VinculoEmpregaticio> lista = query.getResultList();
	manager.close();
	factory.close();

	return lista;
    }

    private List<VinculoEmpregaticio> montarListaEmpregos(AvaliacaoVO avaliacaoVO, Avaliacao avaliacao) {

	List<VinculoEmpregaticio> empregos = new ArrayList<VinculoEmpregaticio>();
	VinculoEmpregaticio vinculoEmpregaticio = null;

	if (avaliacaoVO.getAreaCargo() != null) {

	    for (int i = 0; i < avaliacaoVO.getAreaCargo().length; i++) {

		vinculoEmpregaticio = new VinculoEmpregaticio();
		vinculoEmpregaticio.setAvaliacao(avaliacao);
		vinculoEmpregaticio.setAreaCargo(avaliacaoVO.getAreaCargo()[i]);
		vinculoEmpregaticio.setDataInicio(Util.converterData(avaliacaoVO.getDataInicio()[i]));
		vinculoEmpregaticio.setDataFim(Util.converterData(avaliacaoVO.getDataFim()[i]));
		vinculoEmpregaticio.setTotalMeses(Double.parseDouble(avaliacaoVO.getTotalMeses()[i]));

		empregos.add(vinculoEmpregaticio);
	    }
	}

	return empregos;
    }

}