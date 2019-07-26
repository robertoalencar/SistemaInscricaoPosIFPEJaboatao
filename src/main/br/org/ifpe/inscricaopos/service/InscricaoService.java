package main.br.org.ifpe.inscricaopos.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.br.org.ifpe.inscricaopos.dao.AvaliacaoDao;
import main.br.org.ifpe.inscricaopos.dao.InscricaoDao;
import main.br.org.ifpe.inscricaopos.domain.Avaliacao;
import main.br.org.ifpe.inscricaopos.domain.Inscricao;

@Service
public class InscricaoService {
    
    public static final int CURSO_GESTAO_TOTAL_VAGAS_EDITAL = 30;
    public static final int CURSO_GESTAO_VAGAS_EDITAL_PPI = 5;
    public static final int CURSO_GESTAO_VAGAS_EDITAL_PCD = 2;
    
    public static final int CURSO_INOVACAO_TOTAL_VAGAS_EDITAL = 30;
    public static final int CURSO_INOVACAO_VAGAS_EDITAL_PPI = 5;
    public static final int CURSO_INOVACAO_VAGAS_EDITAL_PCD = 2;
    
    @Autowired
    private AvaliacaoDao avaliacaoDao;
    
    @Autowired
    private InscricaoDao inscricaoDao;
    
    public Map<String, List<Inscricao>> classificarInscricoes() {
	
	List<Inscricao> listaInscricao = inscricaoDao.listar(null, null);

	List<Inscricao> listaGeralGestao = new ArrayList<Inscricao>();
	List<Inscricao> listaGeralInovacao = new ArrayList<Inscricao>();
	List<Inscricao> desclassificadosGestao = new ArrayList<Inscricao>();
	List<Inscricao> desclassificadosInovacao = new ArrayList<Inscricao>();

	/*
	 * O For abaixo, separa as listas dos cursos e as listas dos desclassificados por curso
	 */
	
	for (Inscricao inscricao : listaInscricao) {

	    List<Avaliacao> listaAvaliacao = avaliacaoDao.listar(inscricao.getId(), null);
	    inscricao.setAvaliacoes(listaAvaliacao);

	    for (Avaliacao avaliacao : listaAvaliacao) {

		if (avaliacao.isAprovada()) {

		    if ("Gestao".equals(inscricao.getCursoEscolhido())) {

			if (avaliacao.isDocumentacaoCompleta()) {

			    if (avaliacao.getNotaFinal() == null) {
				avaliacao.setNotaFinal(0.0);
			    }
			    
			    listaGeralGestao.add(inscricao);

			} else {
			    desclassificadosGestao.add(inscricao);
			}

		    } else {

			if (avaliacao.isDocumentacaoCompleta()) {

			    if (avaliacao.getNotaFinal() == null) {
				avaliacao.setNotaFinal(0.0);
			    }
			    
			    listaGeralInovacao.add(inscricao);

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
	
	Collections.sort(listaGeralGestao, Collections.reverseOrder());
	Collections.sort(listaGeralInovacao, Collections.reverseOrder());
	
	int qtdVagasGestaoVCG = CURSO_GESTAO_TOTAL_VAGAS_EDITAL - CURSO_GESTAO_VAGAS_EDITAL_PPI - CURSO_GESTAO_VAGAS_EDITAL_PCD;
	int qtdVagasInovacaoVCG = CURSO_GESTAO_TOTAL_VAGAS_EDITAL - CURSO_GESTAO_VAGAS_EDITAL_PPI - CURSO_GESTAO_VAGAS_EDITAL_PCD;
	
	List<Inscricao> classificadosGestaoVCG = criarListaVCG(qtdVagasGestaoVCG, listaGeralGestao);
	List<Inscricao> classificadosInovacaoVCG = criarListaVCG(qtdVagasInovacaoVCG, listaGeralInovacao);
	
	// --------------------------------------------------------------
	// Dos candidatos que não ficaram entre as 23 melhores notas, será contabilizaddo quantos existem de acordo com as cotas
	// --------------------------------------------------------------
	
	HashMap<String, Integer> qtdCotasGestao = contarCotasGestao(listaGeralGestao);
	HashMap<String, Integer> qtdCotasInovacao = contarCotasInovacao(listaGeralInovacao);
	
	int qtdCandidatosGestaoPPI = qtdCotasGestao.get("qtdCandidatosGestaoPPI");
	int qtdCandidatosGestaoPCD = qtdCotasGestao.get("qtdCandidatosGestaoPCD");
	int qtdCandidatosInovacaoPPI = qtdCotasInovacao.get("qtdCandidatosInovacaoPPI");
	int qtdCandidatosInovacaoPCD = qtdCotasInovacao.get("qtdCandidatosInovacaoPCD");
	
	// --------------------------------------------------------------
	// Montas as listas de acordo com as cotas para o curso de Gestão
	// --------------------------------------------------------------

	int qtdVagasGestaoPPI = qtdCandidatosGestaoPPI > CURSO_GESTAO_VAGAS_EDITAL_PPI ? CURSO_GESTAO_VAGAS_EDITAL_PPI : qtdCandidatosGestaoPPI;
	int qtdVagasGestaoPCD = qtdCandidatosGestaoPCD > CURSO_GESTAO_VAGAS_EDITAL_PCD ? CURSO_GESTAO_VAGAS_EDITAL_PCD : qtdCandidatosGestaoPCD;
	qtdVagasGestaoVCG = CURSO_GESTAO_TOTAL_VAGAS_EDITAL - qtdVagasGestaoVCG - qtdVagasGestaoPPI - qtdVagasGestaoPCD;
	
	List<Inscricao> classificadosGestaoPPI = montarListaCotasPPIPCD("PPI", qtdVagasGestaoPPI, listaGeralGestao);
	List<Inscricao> classificadosGestaoPCD = montarListaCotasPPIPCD("PCD", qtdVagasGestaoPCD, listaGeralGestao);
	
	int qtdVagasRemanecentesGestaoVCG = CURSO_GESTAO_TOTAL_VAGAS_EDITAL - classificadosGestaoVCG.size() - classificadosGestaoPPI.size() - classificadosGestaoPCD.size();
	
	List<Inscricao> inscricoesVagasRemanecentesGestaoVCG = criarListaVCG(qtdVagasRemanecentesGestaoVCG, listaGeralGestao);
	int classificacaoVagasRemanecentesGestaoVCG = classificadosGestaoVCG.size();
	
	for (Inscricao inscricao : inscricoesVagasRemanecentesGestaoVCG) {
	    
	    classificacaoVagasRemanecentesGestaoVCG++;
	    inscricao.setClassificacao(classificacaoVagasRemanecentesGestaoVCG);
	    classificadosGestaoVCG.add(inscricao);    
	}
	
	List<Inscricao> remanejamentoGestaoVCG = criarListaVCG(classificadosGestaoVCG.size(), listaGeralGestao);
	List<Inscricao> remanejamentoGestaoPPI = montarListaCotasPPIPCD("PPI", classificadosGestaoPPI.size(), listaGeralGestao);
	List<Inscricao> remanejamentoGestaoPCD = montarListaCotasPPIPCD("PCD", classificadosGestaoPCD.size(), listaGeralGestao);
	
	List<Inscricao> naoClassificadosGestaoVCG = listaGeralGestao;

	// ----------------------------------------------------------------
	// Montas as listas de acordo com as cotas para o curso de Inovação
	// ----------------------------------------------------------------

	int qtdVagasInovacaoPPI = qtdCandidatosInovacaoPPI > CURSO_INOVACAO_VAGAS_EDITAL_PPI ? CURSO_INOVACAO_VAGAS_EDITAL_PPI : qtdCandidatosInovacaoPPI;
	int qtdVagasInovacaoPCD = qtdCandidatosInovacaoPCD > CURSO_INOVACAO_VAGAS_EDITAL_PCD ? CURSO_INOVACAO_VAGAS_EDITAL_PCD : qtdCandidatosInovacaoPCD;
	
	List<Inscricao> classificadosInovacaoPPI = montarListaCotasPPIPCD("PPI", qtdVagasInovacaoPPI, listaGeralInovacao);
	List<Inscricao> classificadosInovacaoPCD = montarListaCotasPPIPCD("PCD", qtdVagasInovacaoPCD, listaGeralInovacao);
	
	int qtdVagasRemanecentesInovacaoVCG = CURSO_INOVACAO_TOTAL_VAGAS_EDITAL - classificadosInovacaoVCG.size() - classificadosInovacaoPPI.size() - classificadosInovacaoPCD.size();
	
	List<Inscricao> inscricoesVagasRemanecentesInovacaoVCG = criarListaVCG(qtdVagasRemanecentesInovacaoVCG, listaGeralInovacao);
	int classificacaoVagasRemanecentesInovacaoVCG = classificadosInovacaoVCG.size();
	
	for (Inscricao inscricao : inscricoesVagasRemanecentesInovacaoVCG) {
	    
	    classificacaoVagasRemanecentesInovacaoVCG++;
	    inscricao.setClassificacao(classificacaoVagasRemanecentesInovacaoVCG);
	    classificadosInovacaoVCG.add(inscricao);    
	}
	
	List<Inscricao> remanejamentoInovacaoVCG = criarListaVCG(classificadosInovacaoVCG.size(), listaGeralInovacao);
	List<Inscricao> remanejamentoInovacaoPPI = montarListaCotasPPIPCD("PPI", classificadosInovacaoPPI.size(), listaGeralInovacao);
	List<Inscricao> remanejamentoInovacaoPCD = montarListaCotasPPIPCD("PCD", classificadosInovacaoPCD.size(), listaGeralInovacao);
	
	List<Inscricao> naoClassificadosInovacaoVCG = listaGeralInovacao;

	// ---------------------------------------------------------------------------------
	// Carrega o mapa que será utilizaro no controlador para enviar as listas para o JSP
	// ---------------------------------------------------------------------------------

	Map<String, List<Inscricao>> retorno = new HashMap<String, List<Inscricao>>();

	retorno.put("classificadosGestaoVCG", classificadosGestaoVCG);
	retorno.put("classificadosGestaoPPI", classificadosGestaoPPI);
	retorno.put("classificadosGestaoPCD", classificadosGestaoPCD);
	retorno.put("remanejamentoGestaoVCG", remanejamentoGestaoVCG);
	retorno.put("remanejamentoGestaoPPI", remanejamentoGestaoPPI);
	retorno.put("remanejamentoGestaoPCD", remanejamentoGestaoPCD);
	retorno.put("naoClassificadosGestaoVCG", naoClassificadosGestaoVCG);

	retorno.put("classificadosInovacaoVCG", classificadosInovacaoVCG);
	retorno.put("classificadosInovacaoPPI", classificadosInovacaoPPI);
	retorno.put("classificadosInovacaoPCD", classificadosInovacaoPCD);
	retorno.put("remanejamentoInovacaoVCG", remanejamentoInovacaoVCG);
	retorno.put("remanejamentoInovacaoPPI", remanejamentoInovacaoPPI);
	retorno.put("remanejamentoInovacaoPCD", remanejamentoInovacaoPCD);
	retorno.put("naoClassificadosInovacaoVCG", naoClassificadosInovacaoVCG);

	retorno.put("desclassificadosGestao", desclassificadosGestao);
	retorno.put("desclassificadosInovacao", desclassificadosInovacao);

	return retorno;
    }
    
    private List<Inscricao> criarListaVCG(int qtdVagasVCG, List<Inscricao> listaOrdemDecrescente) {

	List<Inscricao> classificadosVCG = new ArrayList<Inscricao>();
	ArrayList<Inscricao> removerDaLista = new ArrayList<Inscricao>();
	int classificao = 1;

	for (Inscricao inscricao : listaOrdemDecrescente) {

	    inscricao.setClassificacao(classificao);
	    classificadosVCG.add(inscricao);
	    classificao++;

	    removerDaLista.add(inscricao);
	    
	    if (classificadosVCG.size() == qtdVagasVCG) {
		break;
	    }
	}

	for (Inscricao inscricao : removerDaLista) {
	    listaOrdemDecrescente.remove(inscricao);
	}

	return classificadosVCG;
    }
    
    private List<Inscricao> montarListaCotasPPIPCD(String tipoVaga, int qtdVagas, List<Inscricao> listaOrdemDecrescente) {

	List<Inscricao> classificados = new ArrayList<Inscricao>();

	if (qtdVagas > 0) {

	    ArrayList<Inscricao> removerDaLista = new ArrayList<Inscricao>();
	    int classificao = 1;

	    for (Inscricao inscricao : listaOrdemDecrescente) {

		for (Avaliacao avaliacao : inscricao.getAvaliacoes()) {

		    if (avaliacao.isAprovada()) {

			if (tipoVaga.equals(avaliacao.getTipoVaga())) {
				
			    inscricao.setClassificacao(classificao);
			    classificados.add(inscricao);
			    classificao++;

			    removerDaLista.add(inscricao);
			}
			
			break;
		    }
		}
			
		if (classificados.size() == qtdVagas) {
		    break;
		}
	    }

	    for (Inscricao inscricao : removerDaLista) {
		listaOrdemDecrescente.remove(inscricao);
	    }
	}

	return classificados;
    }

    private HashMap<String, Integer> contarCotasGestao(List<Inscricao> listaOrdemDecrescente) {

	int qtdCandidatosGestaoPPI = 0;
	int qtdCandidatosGestaoPCD = 0;

	for (Inscricao inscricao : listaOrdemDecrescente) {

	    for (Avaliacao avaliacao : inscricao.getAvaliacoes()) {

		if (avaliacao.isAprovada()) {

		    if ("PPI".equals(avaliacao.getTipoVaga())) {
			qtdCandidatosGestaoPPI++;
		    } else if ("PCD".equals(avaliacao.getTipoVaga())) {
			qtdCandidatosGestaoPCD++;
		    }

		    break;
		}
	    }
	}

	HashMap<String, Integer> qtdCotasGestao = new HashMap<String, Integer>();
	qtdCotasGestao.put("qtdCandidatosGestaoPPI", qtdCandidatosGestaoPPI);
	qtdCotasGestao.put("qtdCandidatosGestaoPCD", qtdCandidatosGestaoPCD);

	return qtdCotasGestao;
    }
    
    private HashMap<String, Integer> contarCotasInovacao(List<Inscricao> listaOrdemDecrescente) {

	int qtdCandidatosInovacaoPPI = 0;
	int qtdCandidatosInovacaoPCD = 0;

	for (Inscricao inscricao : listaOrdemDecrescente) {

	    for (Avaliacao avaliacao : inscricao.getAvaliacoes()) {

		if (avaliacao.isAprovada()) {

		    if ("PPI".equals(avaliacao.getTipoVaga())) {
			qtdCandidatosInovacaoPPI++;
		    } else if ("PCD".equals(avaliacao.getTipoVaga())) {
			qtdCandidatosInovacaoPCD++;
		    }

		    break;
		}
	    }
	}

	HashMap<String, Integer> qtdCotasGestao = new HashMap<String, Integer>();
	qtdCotasGestao.put("qtdCandidatosInovacaoPPI", qtdCandidatosInovacaoPPI);
	qtdCotasGestao.put("qtdCandidatosInovacaoPCD", qtdCandidatosInovacaoPCD);

	return qtdCotasGestao;
    }
}
