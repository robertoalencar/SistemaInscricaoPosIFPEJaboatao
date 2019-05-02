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

    public Avaliacao save(AvaliacaoVO avaliacaoVO, Usuario avaliador) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	manager.getTransaction().begin();

	Avaliacao avaliacao = new Avaliacao();
	avaliacao.setHabilitado(Boolean.TRUE);
	avaliacao.setAvaliador(manager.find(Usuario.class, avaliador.getId()));
	avaliacao.setInscricao(manager.find(Inscricao.class, avaliacaoVO.getIdInscricao()));
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
	for (VinculoEmpregaticio emprego : avaliacao.getEmpregos()) {
	    manager.persist(emprego);
	}

	manager.merge(avaliacao);

	manager.getTransaction().commit();
	manager.close();
	factory.close();

	return avaliacao;
    }
    
    public List<Avaliacao> listar(Long idInscricao) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = manager.createQuery("SELECT a FROM Avaliacao a, Inscricao i WHERE a.inscricao.id = i.id AND i.id = :paramIdInscricao ");
	query.setParameter("paramIdInscricao", idInscricao);
	List<Avaliacao> lista = query.getResultList();
	manager.close();
	factory.close();

	return lista;
    }

    private List<VinculoEmpregaticio> montarListaEmpregos(AvaliacaoVO avaliacaoVO, Avaliacao avaliacao) {

	List<VinculoEmpregaticio> empregos = new ArrayList<VinculoEmpregaticio>();
	VinculoEmpregaticio vinculoEmpregaticio = null;

	for (int i = 0; i < avaliacaoVO.getAreaCargo().length; i++) {

	    vinculoEmpregaticio = new VinculoEmpregaticio();
	    vinculoEmpregaticio.setHabilitado(Boolean.TRUE);
	    vinculoEmpregaticio.setAvaliacao(avaliacao);
	    vinculoEmpregaticio.setAreaCargo(avaliacaoVO.getAreaCargo()[i]);
	    vinculoEmpregaticio.setDataInicio(Util.converterData(avaliacaoVO.getDataInicio()[i]));
	    vinculoEmpregaticio.setDataFim(Util.converterData(avaliacaoVO.getDataFim()[i]));
	    vinculoEmpregaticio.setTotalMeses(Double.parseDouble(avaliacaoVO.getTotalMeses()[i]));

	    empregos.add(vinculoEmpregaticio);
	}

	return empregos;
    }

}