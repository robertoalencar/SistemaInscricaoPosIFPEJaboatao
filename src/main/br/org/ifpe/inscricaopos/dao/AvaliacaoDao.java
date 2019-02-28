package main.br.org.ifpe.inscricaopos.dao;

import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.stereotype.Repository;

import main.br.org.ifpe.inscricaopos.domain.Avaliacao;
import main.br.org.ifpe.inscricaopos.domain.AvaliacaoVO;
import main.br.org.ifpe.inscricaopos.domain.Inscricao;
import main.br.org.ifpe.inscricaopos.domain.Usuario;
import main.br.org.ifpe.inscricaopos.util.HibernateDao;

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
	avaliacao.setAvaliador(avaliador);
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
	
	//private List<VinculoEmpregaticio> empregos
	
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

	manager.getTransaction().commit();
	manager.close();
	factory.close();

	return avaliacao;
    }

}