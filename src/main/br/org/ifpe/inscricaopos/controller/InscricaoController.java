package main.br.org.ifpe.inscricaopos.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import main.br.org.ifpe.inscricaopos.domain.DadosSelecaoVO;
import main.br.org.ifpe.inscricaopos.domain.Inscricao;
import main.br.org.ifpe.inscricaopos.domain.ResultadoSelecaoVO;
import main.br.org.ifpe.inscricaopos.domain.Usuario;
import main.br.org.ifpe.inscricaopos.domain.VinculoEmpregaticio;
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
    public static final String TELA_VISUALIZAR_AVALIACAO = "inscricao/visualizarAvaliacao";
    public static final String TELA_RESULTADO = "inscricao/resultadoSelecao";
    public static final String TELA_RESULTADO_GESTAO = "inscricao/resultadoSelecaoGestao";
    public static final String TELA_RESULTADO_INOVACAO = "inscricao/resultadoSelecaoInovacao";
    public static final String TELA_DADOS_SELECAO = "inscricao/dadosSelecao";

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
    public String delete(@RequestParam Long id, HttpSession session, Model model) {

	if (!Util.validaPerfilUsuario(session, new long[]{1})) {
	    model.addAttribute("mensagem", "Este usuário não tem o perfil de acesso necessário para esta função.");
	    return PrincipalController.TELA_HOME;
	}
	
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
    public String avaliar(@RequestParam Long id, HttpSession session, Model model) {

	if (!Util.validaPerfilUsuario(session, new long[]{1,2})) {
	    model.addAttribute("mensagem", "Este usuário não tem o perfil de acesso necessário para esta função.");
	    return PrincipalController.TELA_HOME;
	}
	
	model.addAttribute("inscricao", inscricaoDao.find(id));

	return TELA_AVALIAR;
    }

    @RequestMapping("/inscricao/avaliacaoSave")
    public String saveAvaliacao(AvaliacaoVO avaliacaoVO, HttpSession session, Model model) {

	if (!Util.validaPerfilUsuario(session, new long[]{1,2})) {
	    model.addAttribute("mensagem", "Este usuário não tem o perfil de acesso necessário para esta função.");
	    return PrincipalController.TELA_HOME;
	}
	
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
    public String aprovarAvaliacao(@RequestParam Long id, @RequestParam Long idAvaliacao, HttpSession session, Model model) {

	if (!Util.validaPerfilUsuario(session, new long[]{1,2})) {
	    model.addAttribute("mensagem", "Este usuário não tem o perfil de acesso necessário para esta função.");
	    return PrincipalController.TELA_HOME;
	}
	
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
	
	Map<String, List<Inscricao>> mapaListas = inscricaoService.classificarInscricoes();
	
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

	Map<String, List<Inscricao>> mapaListas = inscricaoService.classificarInscricoes();

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

	Map<String, List<Inscricao>> mapaListas = inscricaoService.classificarInscricoes();

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
    
    @RequestMapping("/dadosSelecao")
    public String exibirDadosSelecao(Model model) {
	
	DadosSelecaoVO dadosSelecaoVo = montarDadosSelecaoVO();
	model.addAttribute("dadosSelecaoVo", dadosSelecaoVo);

	return TELA_DADOS_SELECAO;
    }
    
    private DadosSelecaoVO montarDadosSelecaoVO() {
	
	DadosSelecaoVO dadosSelecaoVo = new DadosSelecaoVO();
	
	Map<String, List<Inscricao>> mapaListas = inscricaoService.classificarInscricoes();

	List<Inscricao> classificadosGestaoVCG = mapaListas.get("classificadosGestaoVCG");
	List<Inscricao> classificadosGestaoPPI = mapaListas.get("classificadosGestaoPPI");
	List<Inscricao> classificadosGestaoPCD = mapaListas.get("classificadosGestaoPCD");
	List<Inscricao> remanejamentoGestaoVCG = mapaListas.get("remanejamentoGestaoVCG");
	List<Inscricao> remanejamentoGestaoPPI = mapaListas.get("remanejamentoGestaoPPI");
	List<Inscricao> remanejamentoGestaoPCD = mapaListas.get("remanejamentoGestaoPCD");
	List<Inscricao> naoClassificadosGestaoVCG = mapaListas.get("naoClassificadosGestaoVCG");
	List<Inscricao> desclassificadosGestao = mapaListas.get("desclassificadosGestao");
	List<Inscricao> classificadosInovacaoVCG = mapaListas.get("classificadosInovacaoVCG");
	List<Inscricao> classificadosInovacaoPPI = mapaListas.get("classificadosInovacaoPPI");
	List<Inscricao> classificadosInovacaoPCD = mapaListas.get("classificadosInovacaoPCD");
	List<Inscricao> remanejamentoInovacaoVCG = mapaListas.get("remanejamentoInovacaoVCG");
	List<Inscricao> remanejamentoInovacaoPPI = mapaListas.get("remanejamentoInovacaoPPI");
	List<Inscricao> remanejamentoInovacaoPCD = mapaListas.get("remanejamentoInovacaoPCD");
	List<Inscricao> naoClassificadosInovacaoVCG = mapaListas.get("naoClassificadosInovacaoVCG");
	List<Inscricao> desclassificadosInovacao = mapaListas.get("desclassificadosInovacao");

	long quantidadeInscritos = inscricaoDao.listarQuantidadeInscricao();
	int quantidadeInscritosPosGestao = classificadosGestaoVCG.size() + classificadosGestaoPPI.size()
		+ classificadosGestaoPCD.size() + remanejamentoGestaoVCG.size() + remanejamentoGestaoPPI.size()
		+ remanejamentoGestaoPCD.size() + naoClassificadosGestaoVCG.size() + desclassificadosGestao.size();
	int quantidadeInscritosPosInovacao = classificadosInovacaoVCG.size() + classificadosInovacaoPPI.size()
		+ classificadosInovacaoPCD.size() + remanejamentoInovacaoVCG.size() + remanejamentoInovacaoPPI.size()
		+ remanejamentoInovacaoPCD.size() + naoClassificadosInovacaoVCG.size()
		+ desclassificadosInovacao.size();
	int quantidadeDesclassificados = desclassificadosGestao.size() + desclassificadosInovacao.size();

	dadosSelecaoVo.setQuantidadeInscritos(quantidadeInscritos);
	dadosSelecaoVo.setQuantidadeDesclassificados(quantidadeDesclassificados);
	dadosSelecaoVo.setQuantidadeInscritosPosGestao(quantidadeInscritosPosGestao);
	dadosSelecaoVo.setQuantidadeInscritosPosInovacao(quantidadeInscritosPosInovacao);
	dadosSelecaoVo.setQuantitativoClassificadosGestaoVCG(classificadosGestaoVCG.size());
	dadosSelecaoVo.setQuantitativoClassificadosGestaoPPI(classificadosGestaoPPI.size());
	dadosSelecaoVo.setQuantitativoClassificadosGestaoPCD(classificadosGestaoPCD.size());
	dadosSelecaoVo.setQuantitativoClassificadosInovacaoVCG(classificadosInovacaoVCG.size());
	dadosSelecaoVo.setQuantitativoClassificadosInovacaoPPI(classificadosInovacaoPPI.size());
	dadosSelecaoVo.setQuantitativoClassificadosInovacaoPCD(classificadosInovacaoPCD.size());

	if (classificadosGestaoVCG != null && !classificadosGestaoVCG.isEmpty()
		&& classificadosGestaoVCG.get(0).getAvaliacoes() != null
		&& !classificadosGestaoVCG.get(0).getAvaliacoes().isEmpty()) {

	    dadosSelecaoVo.setMaiorNotaGestao(classificadosGestaoVCG.get(0).getAvaliacoes().get(0).getNotaFinal());
	}

	preencherVo(classificadosGestaoVCG, dadosSelecaoVo, "Gestao");
	preencherVo(classificadosGestaoPPI, dadosSelecaoVo, "Gestao");
	preencherVo(classificadosGestaoPCD, dadosSelecaoVo, "Gestao");

	if (classificadosInovacaoVCG != null && !classificadosInovacaoVCG.isEmpty()
		&& classificadosInovacaoVCG.get(0).getAvaliacoes() != null
		&& !classificadosInovacaoVCG.get(0).getAvaliacoes().isEmpty()) {

	    dadosSelecaoVo.setMaiorNotaInovacao(classificadosInovacaoVCG.get(0).getAvaliacoes().get(0).getNotaFinal());
	}

	preencherVo(classificadosInovacaoVCG, dadosSelecaoVo, "Inovacao");
	preencherVo(classificadosInovacaoPPI, dadosSelecaoVo, "Inovacao");
	preencherVo(classificadosInovacaoPCD, dadosSelecaoVo, "Inovacao");
	
	return dadosSelecaoVo;
    }

    private List<ResultadoSelecaoVO> montaVoResultados(Map<String, List<Inscricao>> mapaListas,
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

	List<VinculoEmpregaticio> listaVinculoEmpregaticio = avaliacaoDao
		.listarVinculosEmpregaticios(avaliacao.getId());

	if (listaVinculoEmpregaticio != null && !listaVinculoEmpregaticio.isEmpty()) {

	    int tamanhoLista = listaVinculoEmpregaticio.size();
	    avaliacaoVO.setTotalVinculosEmpregaticios(tamanhoLista - 1);

	    areaCargo = new String[tamanhoLista];
	    dataInicio = new String[tamanhoLista];
	    dataFim = new String[tamanhoLista];
	    totalMeses = new String[tamanhoLista];

	    for (int i = 0; i < tamanhoLista; i++) {

		areaCargo[i] = listaVinculoEmpregaticio.get(i).getAreaCargo();
		dataInicio[i] = Util.converterData(listaVinculoEmpregaticio.get(i).getDataInicio());
		dataFim[i] = Util.converterData(listaVinculoEmpregaticio.get(i).getDataFim());
		totalMeses[i] = String.valueOf(listaVinculoEmpregaticio.get(i).getTotalMeses());
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
    
    private void preencherVo(List<Inscricao> inscricoes, DadosSelecaoVO dadosSelecaoVo, String curso) {

	double menorNota = "Gestao".equals(curso) ? dadosSelecaoVo.getMenorNotaGestao() : dadosSelecaoVo.getMenorNotaInovacao();
	menorNota = menorNota == 0.0 ? 1000 : menorNota;
	
	double somaNotas = "Gestao".equals(curso) ? dadosSelecaoVo.getSomaNotasGestao() : dadosSelecaoVo.getSomaNotasInovacao();
	int perfilCandidatosAreaTI = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoAreaTI() : dadosSelecaoVo.getPerfilCandidatosInovaAreaTI();
	int perfilCandidatosAreaOutras = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoAreaOutras() : dadosSelecaoVo.getPerfilCandidatosInovaAreaOutras();
	int perfilCandidatosExpProf = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoExpProf() : dadosSelecaoVo.getPerfilCandidatosInovaExpProf();
	int perfilCandidatosNaoExpProf = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoNaoExpProf() : dadosSelecaoVo.getPerfilCandidatosInovaNaoExpProf();
	int perfilCandidatosQtdHomens = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoQtdHomens() : dadosSelecaoVo.getPerfilCandidatosInovaQtdHomens();
	int perfilCandidatosQtdMulheres = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoQtdMulheres() : dadosSelecaoVo.getPerfilCandidatosInovaQtdMulheres();
	int perfilCandidatosMenor30 = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoMenor30() : dadosSelecaoVo.getPerfilCandidatosInovaMenor30();
	int perfilCandidatosMaior30Menor40 = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoMaior30Menor40() : dadosSelecaoVo.getPerfilCandidatosInovaMaior30Menor40();
	int perfilCandidatosMaior40Menor50 = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoMaior40Menor50() : dadosSelecaoVo.getPerfilCandidatosInovaMaior40Menor50();
	int perfilCandidatosMaior50 = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoMaior50() : dadosSelecaoVo.getPerfilCandidatosInovaMaior50();

	Calendar calendar;
	Date data1;
	Date data2;
	
	for (Inscricao inscricao : inscricoes) {

	    if ("Masculino".equals(inscricao.getCandidato().getSexo())) {
		perfilCandidatosQtdHomens++;
	    } else {
		perfilCandidatosQtdMulheres++;
	    }
	    
	    if (inscricao.getCandidato().getDataNascimento() != null) {

		calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, (Calendar.getInstance().get(Calendar.YEAR) - 30));
		data1 = calendar.getTime(); // data atual - 30 anos

		if (inscricao.getCandidato().getDataNascimento().after(data1)) {

		    perfilCandidatosMenor30++;

		} else {

		    calendar = Calendar.getInstance();
		    calendar.set(Calendar.YEAR, (Calendar.getInstance().get(Calendar.YEAR) - 40));
		    data1 = calendar.getTime(); // data atual - 40 anos

		    calendar = Calendar.getInstance();
		    calendar.set(Calendar.YEAR, (Calendar.getInstance().get(Calendar.YEAR) - 30));
		    data2 = calendar.getTime(); // data atual - 30 anos

		    if (inscricao.getCandidato().getDataNascimento().after(data1)
			    && inscricao.getCandidato().getDataNascimento().before(data2)) {

			perfilCandidatosMaior30Menor40++;

		    } else {

			calendar = Calendar.getInstance();
			calendar.set(Calendar.YEAR, (Calendar.getInstance().get(Calendar.YEAR) - 50));
			data1 = calendar.getTime(); // data atual - 50 anos

			calendar = Calendar.getInstance();
			calendar.set(Calendar.YEAR, (Calendar.getInstance().get(Calendar.YEAR) - 40));
			data2 = calendar.getTime(); // data atual - 40 anos

			if (inscricao.getCandidato().getDataNascimento().after(data1)
				&& inscricao.getCandidato().getDataNascimento().before(data2)) {

			    perfilCandidatosMaior40Menor50++;

			} else {

			    calendar = Calendar.getInstance();
			    calendar.set(Calendar.YEAR, (Calendar.getInstance().get(Calendar.YEAR) - 50));
			    data1 = calendar.getTime(); // data atual - 50 anos

			    if (inscricao.getCandidato().getDataNascimento().before(data1)) {
				perfilCandidatosMaior50++;
			    }
			}
		    }
		}
	    }

	    for (Avaliacao avaliacao : inscricao.getAvaliacoes()) {

		if (avaliacao != null) {

		    if (avaliacao.getNotaFinal() != null) {

			somaNotas = somaNotas + avaliacao.getNotaFinal();

			if (avaliacao.getNotaFinal() < menorNota) {
			    menorNota = avaliacao.getNotaFinal();
			}
		    }

		    if (avaliacao.getGradQtdCursosComputacao() != null && avaliacao.getGradQtdCursosComputacao() > 0) {
			perfilCandidatosAreaTI++;
		    } else {
			perfilCandidatosAreaOutras++;
		    }

		    if (avaliacao.getQuantidadeVinculosEmpregaticios() > 0) {
			perfilCandidatosExpProf++;
		    } else {
			perfilCandidatosNaoExpProf++;
		    }
		}
	    }
	}

	menorNota = menorNota == 1000 ? 0.0 : menorNota;
	
	if ("Gestao".equals(curso)) {

	    dadosSelecaoVo.setMenorNotaGestao(menorNota);
	    dadosSelecaoVo.setNotaMediaGestao(somaNotas / 30);
	    dadosSelecaoVo.setPerfilCandidatosGestaoAreaTI(perfilCandidatosAreaTI);
	    dadosSelecaoVo.setPerfilCandidatosGestaoAreaOutras(perfilCandidatosAreaOutras);
	    dadosSelecaoVo.setPerfilCandidatosGestaoExpProf(perfilCandidatosExpProf);
	    dadosSelecaoVo.setPerfilCandidatosGestaoNaoExpProf(perfilCandidatosNaoExpProf);
	    dadosSelecaoVo.setPerfilCandidatosGestaoQtdHomens(perfilCandidatosQtdHomens);
	    dadosSelecaoVo.setPerfilCandidatosGestaoQtdMulheres(perfilCandidatosQtdMulheres);
	    dadosSelecaoVo.setPerfilCandidatosGestaoMenor30(perfilCandidatosMenor30);
	    dadosSelecaoVo.setPerfilCandidatosGestaoMaior30Menor40(perfilCandidatosMaior30Menor40);
	    dadosSelecaoVo.setPerfilCandidatosGestaoMaior40Menor50(perfilCandidatosMaior40Menor50);
	    dadosSelecaoVo.setPerfilCandidatosGestaoMaior50(perfilCandidatosMaior50);

	} else {

	    dadosSelecaoVo.setMenorNotaInovacao(menorNota);
	    dadosSelecaoVo.setNotaMediaInovacao(somaNotas / 30);
	    dadosSelecaoVo.setPerfilCandidatosInovaAreaTI(perfilCandidatosAreaTI);
	    dadosSelecaoVo.setPerfilCandidatosInovaAreaOutras(perfilCandidatosAreaOutras);
	    dadosSelecaoVo.setPerfilCandidatosInovaExpProf(perfilCandidatosExpProf);
	    dadosSelecaoVo.setPerfilCandidatosInovaNaoExpProf(perfilCandidatosNaoExpProf);
	    dadosSelecaoVo.setPerfilCandidatosInovaQtdHomens(perfilCandidatosQtdHomens);
	    dadosSelecaoVo.setPerfilCandidatosInovaQtdMulheres(perfilCandidatosQtdMulheres);
	    dadosSelecaoVo.setPerfilCandidatosInovaMenor30(perfilCandidatosMenor30);
	    dadosSelecaoVo.setPerfilCandidatosInovaMaior30Menor40(perfilCandidatosMaior30Menor40);
	    dadosSelecaoVo.setPerfilCandidatosInovaMaior40Menor50(perfilCandidatosMaior40Menor50);
	    dadosSelecaoVo.setPerfilCandidatosInovaMaior50(perfilCandidatosMaior50);
	}
    }

}
