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
import main.br.org.ifpe.inscricaopos.dao.UsuarioDao;
import main.br.org.ifpe.inscricaopos.domain.Avaliacao;
import main.br.org.ifpe.inscricaopos.domain.AvaliacaoVO;
import main.br.org.ifpe.inscricaopos.domain.Candidato;
import main.br.org.ifpe.inscricaopos.domain.Inscricao;
import main.br.org.ifpe.inscricaopos.domain.ResultadoSelecaoVO;
import main.br.org.ifpe.inscricaopos.domain.Usuario;
import main.br.org.ifpe.inscricaopos.service.InscricaoService;
import main.br.org.ifpe.inscricaopos.util.Constantes;

/**
 * @author Roberto Alencar
 *
 */
@Controller
public class InscricaoController {

    public static final String TELA_MANTER = "inscricao/inscricaoSave";
    public static final String TELA_LISTAR = "inscricao/inscricaoList";
    public static final String TELA_AVALIAR = "inscricao/inscricaoAvaliar";
    public static final String TELA_VISUALIZAR_AVALIACAO = "inscricao/visualizarAvaliacao";
    public static final String TELA_RESULTADO = "inscricao/resultadoSelecao";
    public static final String TELA_RESULTADO_GESTAO = "inscricao/resultadoSelecaoGestao";
    public static final String TELA_RESULTADO_INOVACAO = "inscricao/resultadoSelecaoInovacao";

    @Autowired
    private InscricaoDao inscricaoDao;

    @Autowired
    private AvaliacaoDao avaliacaoDao;

    @Autowired
    private InscricaoService inscricaoService;

    @Autowired
    private UsuarioDao usuarioDao;

    @RequestMapping("/inscricao/list")
    public String list(Model model) {

	return TELA_LISTAR;
    }

    @RequestMapping(value = "/inscricao/ordenarRegistros", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Inscricao> ordenarRegistros(@RequestParam String criterioOrdenacao,
	    @RequestParam String ordem) {

	return inscricaoDao.listar(criterioOrdenacao, ordem);
    }

    @RequestMapping(value = "/inscricao/filter", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Inscricao> filter(@RequestParam String numInscricao, @RequestParam String nome) {

	return inscricaoDao.filtrar(numInscricao, nome);
    }

    @RequestMapping("/inscricao/add")
    public String add(Model model) {

	model.addAttribute("listaAvaliadores", usuarioDao.list("nome", null));
	model.addAttribute("operacao", "save");

	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/save")
    public String save(Candidato candidato, @RequestParam String cursoEscolhido, @RequestParam String avaliadorAlocado,
	    Model model) {

	Inscricao inscricao = inscricaoDao.save(candidato, cursoEscolhido, avaliadorAlocado);
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
	model.addAttribute("listaAvaliadores", usuarioDao.list("nome", null));
	model.addAttribute("operacao", "view");

	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/edit")
    public String edit(@RequestParam Long id, Model model) {

	model.addAttribute("inscricao", inscricaoDao.find(id));
	model.addAttribute("listaAvaliadores", usuarioDao.list("nome", null));
	model.addAttribute("operacao", "update");

	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/update")
    public String update(Candidato candidato, @RequestParam Long idInscricao, @RequestParam String cursoEscolhido,
	    @RequestParam String avaliadorAlocado, Model model) {

	Inscricao inscricao = inscricaoDao.find(idInscricao);
	inscricao.setCursoEscolhido(cursoEscolhido);
	inscricao.setAvaliadorAlocado(avaliadorAlocado);

	inscricaoDao.update(candidato, inscricao);

	model.addAttribute("mensagem", "Inscrição atualizada com sucesso!");
	model.addAttribute("inscricao", inscricaoDao.obterInscricaoCandidato(candidato.getId()));
	model.addAttribute("listaAvaliadores", usuarioDao.list("nome", null));
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
	model.addAttribute("listaAvaliadores", usuarioDao.list("nome", null));
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

	List<Avaliacao> listaAvaliacoes = avaliacaoDao.listar(avaliacaoVO.getIdInscricao(), null);

	String nomeCandidato = null;
	for (Avaliacao avaliacao : listaAvaliacoes) {
	    nomeCandidato = avaliacao.getInscricao().getCandidato().getNome();
	    break;
	}

	model.addAttribute("nomeCandidato", nomeCandidato);
	model.addAttribute("listaAvaliacoes", listaAvaliacoes);
	model.addAttribute("listaAvaliadores", usuarioDao.list("nome", null));

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

    @RequestMapping("/inscricao/avaliacaoView")
    public String visualizarAvaliacao(@RequestParam Long id, @RequestParam Long idAvaliacao, Model model) {

	Inscricao inscricao = inscricaoDao.find(id);
	Avaliacao avaliacao = avaliacaoDao.find(idAvaliacao);

	model.addAttribute("inscricao", inscricao);
	model.addAttribute("avaliacaoVO", montarAvaliacaoVO(inscricao, avaliacao));

	return TELA_VISUALIZAR_AVALIACAO;
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

    @RequestMapping("/exibirResultadoSelecaoGestao")
    public String exibirResultadoSelecaoGestao(Model model) {

	Map<String, Collection<Inscricao>> mapaListas = inscricaoService
		.classificarInscricoes(inscricaoDao.listar(null, null));

	model.addAttribute("classificadosGestaoVCG", montaVoResultados(mapaListas, "classificadosGestaoVCG"));
	model.addAttribute("classificadosGestaoPPI", montaVoResultados(mapaListas, "classificadosGestaoPPI"));
	model.addAttribute("classificadosGestaoPCD", montaVoResultados(mapaListas, "classificadosGestaoPCD"));

	model.addAttribute("remanejamentoGestaoVCG", montaVoResultados(mapaListas, "remanejamentoGestaoVCG"));
	model.addAttribute("remanejamentoGestaoPPI", montaVoResultados(mapaListas, "remanejamentoGestaoPPI"));
	model.addAttribute("remanejamentoGestaoPCD", montaVoResultados(mapaListas, "remanejamentoGestaoPCD"));
	model.addAttribute("naoClassificadosGestaoVCG", montaVoResultados(mapaListas, "naoClassificadosGestaoVCG"));

	model.addAttribute("desclassificadosGestao", montaVoResultados(mapaListas, "desclassificadosGestao"));

	return TELA_RESULTADO_GESTAO;
    }

    @RequestMapping("/exibirResultadoSelecaoInovacao")
    public String exibirResultadoSelecaoInovacao(Model model) {

	Map<String, Collection<Inscricao>> mapaListas = inscricaoService
		.classificarInscricoes(inscricaoDao.listar(null, null));

	model.addAttribute("classificadosInovacaoVCG", montaVoResultados(mapaListas, "classificadosInovacaoVCG"));
	model.addAttribute("classificadosInovacaoPPI", montaVoResultados(mapaListas, "classificadosInovacaoPPI"));
	model.addAttribute("classificadosInovacaoPCD", montaVoResultados(mapaListas, "classificadosInovacaoPCD"));

	model.addAttribute("remanejamentoInovacaoVCG", montaVoResultados(mapaListas, "remanejamentoInovacaoVCG"));
	model.addAttribute("remanejamentoInovacaoPPI", montaVoResultados(mapaListas, "remanejamentoInovacaoPPI"));
	model.addAttribute("remanejamentoInovacaoPCD", montaVoResultados(mapaListas, "remanejamentoInovacaoPCD"));
	model.addAttribute("naoClassificadosInovacaoVCG", montaVoResultados(mapaListas, "naoClassificadosInovacaoVCG"));

	model.addAttribute("desclassificadosInovacao", montaVoResultados(mapaListas, "desclassificadosInovacao"));

	return TELA_RESULTADO_INOVACAO;
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

    private AvaliacaoVO montarAvaliacaoVO(Inscricao inscricao, Avaliacao avaliacao) {

	AvaliacaoVO avaliacaoVO = new AvaliacaoVO();

	avaliacaoVO.setIdInscricao(inscricao.getId());
	avaliacaoVO.setDocumentacaoCompleta(avaliacao.isDocumentacaoCompleta());
	avaliacaoVO.setNotaFinal(avaliacao.getNotaFinal());
	avaliacaoVO.setTipoVaga(avaliacao.getTipoVaga());
	avaliacaoVO.setObservacoes(avaliacao.getObservacoes());

	avaliacaoVO.setGradQtdCursosComputacao(avaliacao.getGradQtdCursosComputacao());
	avaliacaoVO.setGradQtdCursosOutros(avaliacao.getGradQtdCursosOutros());
	avaliacaoVO.setGradPontuacaoItem(avaliacao.getGradPontuacaoItem());
	avaliacaoVO.setGradPontuacaoTotal(avaliacao.getGradPontuacaoTotal());

	avaliacaoVO.setQtdAtigosComputacao(avaliacao.getQtdAtigosComputacao());
	avaliacaoVO.setQtdAtigosOutras(avaliacao.getQtdAtigosOutras());
	avaliacaoVO.setProdCientificaPontuacaoTotal(avaliacao.getProdCientificaPontuacaoTotal());
	avaliacaoVO.setProdCientificaPontuacaoItem(avaliacao.getProdCientificaPontuacaoItem());

	String[] areaCargo = null;
	String[] dataInicio = null;
	String[] dataFim = null;
	String[] totalMeses = null;

	if (avaliacao.getEmpregos() != null && !avaliacao.getEmpregos().isEmpty()) {

	    areaCargo = new String[avaliacao.getEmpregos().size()];
	    dataInicio = new String[avaliacao.getEmpregos().size()];
	    dataFim = new String[avaliacao.getEmpregos().size()];
	    totalMeses = new String[avaliacao.getEmpregos().size()];

	    for (int i = 0; i < avaliacao.getEmpregos().size(); i++) {
		areaCargo[i] = avaliacao.getEmpregos().get(i).getAreaCargo();
		dataInicio[i] = String.valueOf(avaliacao.getEmpregos().get(i).getDataInicio());
		dataFim[i] = String.valueOf(avaliacao.getEmpregos().get(i).getDataFim());
		totalMeses[i] = String.valueOf(avaliacao.getEmpregos().get(i).getTotalMeses());
	    }
	}

	avaliacaoVO.setAreaCargo(areaCargo);
	avaliacaoVO.setDataInicio(dataInicio);
	avaliacaoVO.setDataFim(dataFim);
	avaliacaoVO.setTotalMeses(totalMeses);

	avaliacaoVO.setExpProfTotalMesesAreaComp(avaliacao.getExpProfTotalMesesAreaComp());
	avaliacaoVO.setExpProfTotalMesesOutras(avaliacao.getExpProfTotalMesesOutras());
	avaliacaoVO.setExpProfPontuacaoTotal(avaliacao.getExpProfPontuacaoTotal());
	avaliacaoVO.setExpProfPontuacaoItem(avaliacao.getExpProfPontuacaoItem());

	avaliacaoVO.setHistoricoMediaGeral(avaliacao.getHistoricoMediaGeral());
	avaliacaoVO.setHistoricoFatorCargaHoraria(avaliacao.getHistoricoFatorCargaHoraria());
	avaliacaoVO.setHistoricoPontuacaoTotal(avaliacao.getHistoricoPontuacaoTotal());
	avaliacaoVO.setHistoricoPontuacaoItem(avaliacao.getHistoricoPontuacaoItem());

	return avaliacaoVO;

    }

}
