package main.br.org.ifpe.inscricaopos.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.br.org.ifpe.inscricaopos.dao.AvaliacaoDao;
import main.br.org.ifpe.inscricaopos.domain.Avaliacao;
import main.br.org.ifpe.inscricaopos.domain.Inscricao;

@Service
public class InscricaoService {

    @Autowired
    private AvaliacaoDao avaliacaoDao;

    public Map<String, Collection<Inscricao>> classificarInscricoes(List<Inscricao> listaInscricao) {

	List<Inscricao> desclassificadosGestao = new ArrayList<Inscricao>();
	List<Inscricao> desclassificadosInovacao = new ArrayList<Inscricao>();

	int qtdCandidatosGestaoPPI = 0;
	int qtdCandidatosGestaoPCD = 0;

	int qtdCandidatosInovacaoPPI = 0;
	int qtdCandidatosInovacaoPCD = 0;

	// -----------------------------------------------------------------------------
	// Cria as listas ordenadas da menor nota para a maior nota, separadas por curso
	// -----------------------------------------------------------------------------

	TreeMap<Double, Inscricao> listaOrdemCrescentePosInovacao = new TreeMap<Double, Inscricao>();
	TreeMap<Double, Inscricao> listaOrdemCrescentePosGestao = new TreeMap<Double, Inscricao>();

	for (Inscricao inscricao : listaInscricao) {

	    List<Avaliacao> listaAvaliacao = avaliacaoDao.listar(inscricao.getId());
	    inscricao.setAvaliacoes(listaAvaliacao);

	    for (Avaliacao avaliacao : listaAvaliacao) {

		if (avaliacao.isAprovada()) {

		    if ("Gestao".equals(inscricao.getCursoEscolhido())) {

			if (avaliacao.isDocumentacaoCompleta()) {

			    if ("PPI".equals(avaliacao.getTipoVaga())) {
				qtdCandidatosGestaoPPI++;
			    } else if ("PCD".equals(avaliacao.getTipoVaga())) {
				qtdCandidatosGestaoPCD++;
			    }

			    listaOrdemCrescentePosGestao.put(avaliacao.getNotaFinal(), inscricao);

			} else {
			    desclassificadosGestao.add(inscricao);
			}

		    } else {

			if (avaliacao.isDocumentacaoCompleta()) {

			    if ("PPI".equals(avaliacao.getTipoVaga())) {
				qtdCandidatosInovacaoPPI++;
			    } else if ("PCD".equals(avaliacao.getTipoVaga())) {
				qtdCandidatosInovacaoPCD++;
			    }

			    listaOrdemCrescentePosInovacao.put(avaliacao.getNotaFinal(), inscricao);

			} else {
			    desclassificadosInovacao.add(inscricao);
			}
		    }

		    break;
		}
	    }
	}

	// ------------------------------------------------
	// Ordena as listas da maior nota pata a menor nota
	// ------------------------------------------------
	
	TreeMap<Integer, Inscricao> listaOrdemDecrescentePosInovacao = ordenaListaOrdemDecrescente(listaOrdemCrescentePosInovacao);
	TreeMap<Integer, Inscricao> listaOrdemDecrescentePosGestao = ordenaListaOrdemDecrescente(listaOrdemCrescentePosGestao);
	

	// --------------------------------------------------------------
	// Montas as listas de acordo com as vagas para o curso de Gestão
	// --------------------------------------------------------------

	int qtdVagasGestaoPCD = qtdCandidatosGestaoPCD > 2 ? 2 : qtdCandidatosGestaoPCD;
	int qtdVagasGestaoPPI = qtdCandidatosGestaoPPI > 5 ? 5 : qtdCandidatosGestaoPPI;
	int qtdVagasGestaoVCG = 30 - qtdCandidatosGestaoPPI - qtdCandidatosGestaoPCD;

	List<Inscricao> classificadosGestaoVCG = montarListaVCG(qtdVagasGestaoVCG, listaOrdemDecrescentePosGestao);
	List<Inscricao> classificadosGestaoPPI = montarListaCotasPPIPCD("PPI", qtdVagasGestaoPPI, listaOrdemDecrescentePosGestao);
	List<Inscricao> classificadosGestaoPCD = montarListaCotasPPIPCD("PCD", qtdVagasGestaoPCD, listaOrdemDecrescentePosGestao);

	// ----------------------------------------------------------------
	// Montas as listas de acordo com as vagas para o curso de Inovação
	// ----------------------------------------------------------------

	int qtdVagasInovacaoPCD = qtdCandidatosInovacaoPCD > 2 ? 2 : qtdCandidatosInovacaoPCD;
	int qtdVagasInovacaoPPI = qtdCandidatosInovacaoPPI > 5 ? 5 : qtdCandidatosInovacaoPPI;
	int qtdVagasInovacaoVCG = 30 - qtdCandidatosInovacaoPPI - qtdCandidatosInovacaoPCD;

	List<Inscricao> classificadosInovacaoVCG = montarListaVCG(qtdVagasInovacaoVCG, listaOrdemDecrescentePosInovacao);
	List<Inscricao> classificadosInovacaoPPI = montarListaCotasPPIPCD("PPI", qtdVagasInovacaoPPI, listaOrdemDecrescentePosInovacao);
	List<Inscricao> classificadosInovacaoPCD = montarListaCotasPPIPCD("PCD", qtdVagasInovacaoPCD, listaOrdemDecrescentePosInovacao);

	// ---------------------------------------------------------------------------------
	// Carrega o mapa que será utilizaro no controlador para enviar as listas para o JSP
	// ---------------------------------------------------------------------------------

	Map<String, Collection<Inscricao>> retorno = new HashMap<String, Collection<Inscricao>>();

	retorno.put("classificadosGestaoVCG", classificadosGestaoVCG);
	retorno.put("classificadosGestaoPPI", classificadosGestaoPPI);
	retorno.put("classificadosGestaoPCD", classificadosGestaoPCD);

	retorno.put("classificadosInovacaoVCG", classificadosInovacaoVCG);
	retorno.put("classificadosInovacaoPPI", classificadosInovacaoPPI);
	retorno.put("classificadosInovacaoPCD", classificadosInovacaoPCD);

	retorno.put("desclassificadosGestao", desclassificadosGestao);
	retorno.put("desclassificadosInovacao", desclassificadosInovacao);

	return retorno;
    }
    
    private TreeMap<Integer, Inscricao> ordenaListaOrdemDecrescente(TreeMap<Double, Inscricao> lista) {
	
	TreeMap<Integer, Inscricao> listaOrdemDecrescente = new TreeMap<Integer, Inscricao>();
	
	int totalInscritos = lista.values().size();
	for (Inscricao inscricao : lista.values()) {

	    listaOrdemDecrescente.put(totalInscritos, inscricao);
	    totalInscritos--;
	}
	
	return listaOrdemDecrescente;
    }
    
    private List<Inscricao> montarListaVCG(int qtdVagasVCG, TreeMap<Integer, Inscricao> listaOrdemDecrescente) {
	
	List<Inscricao> classificadosVCG = new ArrayList<Inscricao>();
	Inscricao inscricao;
	
	int classificao = 1;
	for (Integer chave : listaOrdemDecrescente.keySet()) {

	    if (classificao <= qtdVagasVCG) {

		inscricao = listaOrdemDecrescente.get(chave);

		inscricao.setClassificacao(classificao);
		classificadosVCG.add(inscricao);
		classificao++;

		listaOrdemDecrescente.remove(chave);
	    }
	}
	
	return classificadosVCG;
    }
    
    private List<Inscricao> montarListaCotasPPIPCD(String tipoVaga, int qtdVagas, TreeMap<Integer, Inscricao> listaOrdemDecrescente) {
	
	List<Inscricao> classificados = new ArrayList<Inscricao>();
	Inscricao inscricao;
	int classificao = 1;
	
	for (Integer chave : listaOrdemDecrescente.keySet()) {

	    if (classificao <= qtdVagas) {

		inscricao = listaOrdemDecrescente.get(chave);

		for (Avaliacao avaliacao : inscricao.getAvaliacoes()) {
		    if (avaliacao.isAprovada()) {

			if (tipoVaga.equals(avaliacao.getTipoVaga())) {

			    inscricao.setClassificacao(classificao);
			    classificados.add(inscricao);
			    classificao++;

			    listaOrdemDecrescente.remove(chave);
			}

			break;
		    }
		}
	    }
	}
	
	return classificados;
    }

}