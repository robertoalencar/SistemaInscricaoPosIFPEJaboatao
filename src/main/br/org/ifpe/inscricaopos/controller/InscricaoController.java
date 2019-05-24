package main.br.org.ifpe.inscricaopos.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.br.org.ifpe.inscricaopos.dao.AvaliacaoDao;
import main.br.org.ifpe.inscricaopos.dao.InscricaoDao;
import main.br.org.ifpe.inscricaopos.domain.Avaliacao;
import main.br.org.ifpe.inscricaopos.domain.AvaliacaoVO;
import main.br.org.ifpe.inscricaopos.domain.Candidato;
import main.br.org.ifpe.inscricaopos.domain.Inscricao;
import main.br.org.ifpe.inscricaopos.domain.InscricoesVO;
import main.br.org.ifpe.inscricaopos.domain.ResultadoSelecaoVO;
import main.br.org.ifpe.inscricaopos.domain.Usuario;
import main.br.org.ifpe.inscricaopos.service.InscricaoService;
import main.br.org.ifpe.inscricaopos.util.Constantes;
import main.br.org.ifpe.inscricaopos.util.Util;

/**
 * @author Roberto Alencar
 *
 */
@Controller
public class InscricaoController {

    public static final String TELA_MANTER = "inscricao/inscricaoSave";
    public static final String TELA_LISTAR = "inscricao/inscricaoList";
    public static final String TELA_AVALIAR = "inscricao/inscricaoAvaliar";
    public static final String TELA_RESULTADO = "inscricao/resultadoSelecao";

    @Autowired
    private InscricaoDao inscricaoDao;

    @Autowired
    private AvaliacaoDao avaliacaoDao;

    @Autowired
    private InscricaoService inscricaoService;

    @RequestMapping("/inscricao/list")
    public String list(Model model) {

	return TELA_LISTAR;
    }

    @RequestMapping(value = "/inscricao/ordenarRegistros", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<InscricoesVO> ordenarRegistros(@RequestParam String criterioOrdenacao,
	    @RequestParam String ordem) {

	return montarVOInscricoes(inscricaoDao.listar(criterioOrdenacao, ordem));
    }

    @RequestMapping(value = "/inscricao/filter", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<InscricoesVO> filter(@RequestParam String numInscricao, @RequestParam String nome) {

	return montarVOInscricoes(inscricaoDao.filtrar(numInscricao, nome));
    }

    private List<InscricoesVO> montarVOInscricoes(List<Inscricao> inscricoes) {

	List<InscricoesVO> listaInscricoesVO = new ArrayList<>();
	List<Avaliacao> listaAvaliacoes;
	InscricoesVO inscricaoVO;

	for (Inscricao inscricao : inscricoes) {

	    inscricaoVO = new InscricoesVO();
	    inscricaoVO.setInscricao(inscricao);

	    listaAvaliacoes = avaliacaoDao.listar(inscricao.getId(), null);
	    Util.definirStatusInscricao(listaAvaliacoes, inscricaoVO);

	    inscricaoVO.setQtdAvaliacoes(listaAvaliacoes.size());
	    listaInscricoesVO.add(inscricaoVO);
	}

	return listaInscricoesVO;
    }

    @RequestMapping("/inscricao/add")
    public String add(Model model) {

	model.addAttribute("operacao", "save");
	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/save")
    public String save(Candidato candidato, @RequestParam String cursoEscolhido, Model model) {

	Inscricao inscricao = inscricaoDao.save(candidato, cursoEscolhido);
	model.addAttribute("inscricao", inscricao);
	model.addAttribute("mensagem", "Inscrição inserida com sucesso!");
	
	List<Avaliacao> listaAvaliacoes = avaliacaoDao.listar(inscricao.getId(), null);

	String nomeCandidato = null;
	for (Avaliacao avaliacao : listaAvaliacoes) {
	    nomeCandidato = avaliacao.getInscricao().getCandidato().getNome();
	    break;
	}

	model.addAttribute("nomeCandidato", nomeCandidato);
	model.addAttribute("listaAvaliacoes", listaAvaliacoes);
	model.addAttribute("operacao", "view");

	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/edit")
    public String edit(@RequestParam Long id, Model model) {

	model.addAttribute("inscricao", inscricaoDao.find(id));
	model.addAttribute("operacao", "update");

	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/update")
    public String update(Candidato candidato, @RequestParam Long idInscricao, @RequestParam String cursoEscolhido,
	    Model model) {

	Inscricao inscricao = inscricaoDao.find(idInscricao);
	inscricao.setCursoEscolhido(cursoEscolhido);

	inscricaoDao.update(candidato, inscricao);

	model.addAttribute("mensagem", "Inscrição atualizada com sucesso!");
	model.addAttribute("inscricao", inscricaoDao.obterInscricaoCandidato(candidato.getId()));
	model.addAttribute("operacao", "update");

	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/delete")
    public String delete(@RequestParam Long id, Model model) {

	inscricaoDao.remove(id);
	model.addAttribute("mensagem", "Inscrição Removida com Sucesso");

	return "forward:list";
    }

    @RequestMapping("/inscricao/view")
    public String view(@RequestParam Long id, Model model) {

	List<Avaliacao> listaAvaliacoes = avaliacaoDao.listar(id, null);

	String nomeCandidato = null;
	for (Avaliacao avaliacao : listaAvaliacoes) {
	    nomeCandidato = avaliacao.getInscricao().getCandidato().getNome();
	    break;
	}

	model.addAttribute("nomeCandidato", nomeCandidato);
	model.addAttribute("listaAvaliacoes", listaAvaliacoes);
	model.addAttribute("inscricao", inscricaoDao.find(id));
	model.addAttribute("operacao", "view");

	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/avaliar")
    public String avaliar(@RequestParam Long id, Model model) {

	model.addAttribute("inscricao", inscricaoDao.find(id));

	return TELA_AVALIAR;
    }

    @RequestMapping("/inscricao/avaliacaoSave")
    public String saveAvaliacao(AvaliacaoVO avaliacaoVO, HttpSession session, Model model) {

	avaliacaoDao.save(avaliacaoVO, (Usuario) session.getAttribute(Constantes.USUARIO_SESSAO));

	model.addAttribute("mensagem", "Avaliação inserida com sucesso!");
	model.addAttribute("operacao", "view");
	model.addAttribute("inscricao", inscricaoDao.find(avaliacaoVO.getIdInscricao()));

	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/aprovarAvaliacao")
    public String aprovarAvaliacao(@RequestParam Long id, @RequestParam Long idAvaliacao, Model model) {

	Avaliacao avaliacao = avaliacaoDao.find(idAvaliacao);
	avaliacao.setAprovada(true);
	avaliacaoDao.aprovarAvaliacao(avaliacao);

	model.addAttribute("mensagem", "Avaliação aprovada com sucesso!");

	return "forward:view";
    }

    @RequestMapping("/exibirResultadoSelecao")
    public String exibirResultadoSelecao(Model model) {

	Map<String, Collection<Inscricao>> mapaListas = inscricaoService
		.classificarInscricoes(inscricaoDao.listar(null, null));

	model.addAttribute("classificadosGestaoVCG", montaVoResultados(mapaListas, "classificadosGestaoVCG"));
	model.addAttribute("classificadosGestaoPPI", montaVoResultados(mapaListas, "classificadosGestaoPPI"));
	model.addAttribute("classificadosGestaoPCD", montaVoResultados(mapaListas, "classificadosGestaoPCD"));
	
	model.addAttribute("remanejamentoGestaoVCG", montaVoResultados(mapaListas, "remanejamentoGestaoVCG"));
	model.addAttribute("remanejamentoGestaoPPI", montaVoResultados(mapaListas, "remanejamentoGestaoPPI"));
	model.addAttribute("remanejamentoGestaoPCD", montaVoResultados(mapaListas, "remanejamentoGestaoPCD"));
	model.addAttribute("naoClassificadosGestaoVCG", montaVoResultados(mapaListas, "naoClassificadosGestaoVCG"));
	
	model.addAttribute("classificadosInovacaoVCG", montaVoResultados(mapaListas, "classificadosInovacaoVCG"));
	model.addAttribute("classificadosInovacaoPPI", montaVoResultados(mapaListas, "classificadosInovacaoPPI"));
	model.addAttribute("classificadosInovacaoPCD", montaVoResultados(mapaListas, "classificadosInovacaoPCD"));
	
	model.addAttribute("remanejamentoInovacaoVCG", montaVoResultados(mapaListas, "remanejamentoInovacaoVCG"));
	model.addAttribute("remanejamentoInovacaoPPI", montaVoResultados(mapaListas, "remanejamentoInovacaoPPI"));
	model.addAttribute("remanejamentoInovacaoPCD", montaVoResultados(mapaListas, "remanejamentoInovacaoPCD"));
	model.addAttribute("naoClassificadosInovacaoVCG", montaVoResultados(mapaListas, "naoClassificadosInovacaoVCG"));
	
	model.addAttribute("desclassificadosGestao", montaVoResultados(mapaListas, "desclassificadosGestao"));
	model.addAttribute("desclassificadosInovacao", montaVoResultados(mapaListas, "desclassificadosInovacao"));

	return TELA_RESULTADO;
    }

    private List<ResultadoSelecaoVO> montaVoResultados(Map<String, Collection<Inscricao>> mapaListas,
	    String tipoLista) {

	List<ResultadoSelecaoVO> listaResultado = new ArrayList<ResultadoSelecaoVO>();
	ResultadoSelecaoVO resultadoSelecaoVO = new ResultadoSelecaoVO();

	for (Inscricao inscricao : mapaListas.get(tipoLista)) {

	    Double nota = 0.0;

	    for (Avaliacao avaliacao : inscricao.getAvaliacoes()) {
		if (avaliacao.isAprovada()) {
		    nota = avaliacao.getNotaFinal();
		    break;
		}
	    }

	    resultadoSelecaoVO = new ResultadoSelecaoVO();
	    resultadoSelecaoVO.setInscricao(inscricao);
	    resultadoSelecaoVO.setNotaCandidato(nota);
	    listaResultado.add(resultadoSelecaoVO);
	}

	return listaResultado;

    }

}
