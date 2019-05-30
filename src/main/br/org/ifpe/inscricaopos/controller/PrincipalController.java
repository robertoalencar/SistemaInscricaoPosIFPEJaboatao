package main.br.org.ifpe.inscricaopos.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import main.br.org.ifpe.inscricaopos.dao.InscricaoDao;
import main.br.org.ifpe.inscricaopos.dao.UsuarioDao;
import main.br.org.ifpe.inscricaopos.domain.Avaliacao;
import main.br.org.ifpe.inscricaopos.domain.DadosSelecaoVO;
import main.br.org.ifpe.inscricaopos.domain.Inscricao;
import main.br.org.ifpe.inscricaopos.domain.Usuario;
import main.br.org.ifpe.inscricaopos.service.InscricaoService;
import main.br.org.ifpe.inscricaopos.util.Constantes;
import main.br.org.ifpe.inscricaopos.util.Criptografia;

/**
 * @author Roberto Alencar
 *
 */
@Controller
public class PrincipalController {

    public static final String TELA_INDEX = "principal/index";
    public static final String TELA_HOME = "principal/home";

    @Autowired
    private InscricaoService inscricaoService;

    @Autowired
    private InscricaoDao inscricaoDao;
    
    @Autowired
    private UsuarioDao usuarioDao;

    @RequestMapping("/home")
    public String home(Model model) {

	DadosSelecaoVO dadosSelecaoVo = new DadosSelecaoVO();

	List<Inscricao> inscricoes = inscricaoDao.listar(null, null);

	if (!inscricoes.isEmpty()) {

	    Map<String, List<Inscricao>> mapaListas = inscricaoService.classificarInscricoes(inscricoes);

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

	    int quantidadeInscritos = inscricoes.size();
	    int quantidadeInscritosPosGestao = classificadosGestaoVCG.size() + classificadosGestaoPPI.size() + classificadosGestaoPCD.size() + remanejamentoGestaoVCG.size() + remanejamentoGestaoPPI.size() + remanejamentoGestaoPCD.size() + naoClassificadosGestaoVCG.size() + desclassificadosGestao.size();
	    int quantidadeInscritosPosInovacao = classificadosInovacaoVCG.size() + classificadosInovacaoPPI.size() + classificadosInovacaoPCD.size() + remanejamentoInovacaoVCG.size() + remanejamentoInovacaoPPI.size() + remanejamentoInovacaoPCD.size() + naoClassificadosInovacaoVCG.size() + desclassificadosInovacao.size();
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

		dadosSelecaoVo
			.setMaiorNotaInovacao(classificadosInovacaoVCG.get(0).getAvaliacoes().get(0).getNotaFinal());
	    }

	    preencherVo(classificadosInovacaoVCG, dadosSelecaoVo, "Inovacao");
	    preencherVo(classificadosInovacaoPPI, dadosSelecaoVo, "Inovacao");
	    preencherVo(classificadosInovacaoPCD, dadosSelecaoVo, "Inovacao");
	}

	model.addAttribute("dadosSelecaoVo", dadosSelecaoVo);

	return TELA_HOME;
    }

    @RequestMapping("/efetuarLogin")
    public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {

	usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
	Usuario usuarioLogado = usuarioDao.buscarUsuario(usuario);

	if (usuarioLogado != null) {
	    session.setAttribute(Constantes.USUARIO_SESSAO, usuarioLogado);
	    return "forward:home";
	}

	model.addAttribute("msg", "Não foi encontrado um usuário com o login e senha informados.");
	return TELA_INDEX;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {

	session.setAttribute(Constantes.USUARIO_SESSAO, null);
	return TELA_INDEX;
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
	int perfilCandidatosMaior40Menor50 = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoMaior40Menor50() : dadosSelecaoVo.getPerfilCandidatosGestaoMaior40Menor50();
	int perfilCandidatosMaior50 = "Gestao".equals(curso) ? dadosSelecaoVo.getPerfilCandidatosGestaoMaior50() : dadosSelecaoVo.getPerfilCandidatosGestaoMaior50();

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

		somaNotas = somaNotas + avaliacao.getNotaFinal();

		if (avaliacao.getNotaFinal() < menorNota) {
		    menorNota = avaliacao.getNotaFinal();
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
