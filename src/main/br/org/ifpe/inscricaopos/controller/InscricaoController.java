package main.br.org.ifpe.inscricaopos.controller;

import java.util.ArrayList;
import java.util.List;

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
import main.br.org.ifpe.inscricaopos.domain.Usuario;
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

    @Autowired
    private InscricaoDao inscricaoDao;

    @Autowired
    private AvaliacaoDao avaliacaoDao;

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
	InscricoesVO inscricoesVO;

	for (Inscricao inscricao : inscricoes) {

	    inscricoesVO = new InscricoesVO();
	    inscricoesVO.setInscricao(inscricao);
	    inscricoesVO.setQtdAvaliacoes(avaliacaoDao.listar(inscricao.getId()).size());
	    listaInscricoesVO.add(inscricoesVO);
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

	model.addAttribute("inscricao", inscricaoDao.save(candidato, cursoEscolhido));
	model.addAttribute("mensagem", "Inscrição inserida com sucesso!");

	return "forward:add";
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

    @RequestMapping("/inscricao/viewEvaluations")
    public String viewEvaluations(@RequestParam Long id, Model model) {

	List<Avaliacao> listaAvaliacoes = avaliacaoDao.listar(id);

	String nomeCandidato = null;
	for (Avaliacao avaliacao : listaAvaliacoes) {
	    nomeCandidato = avaliacao.getInscricao().getCandidato().getNome();
	    break;
	}

	model.addAttribute("exibirAvaliacoes", true);
	model.addAttribute("nomeCandidato", nomeCandidato);
	model.addAttribute("listaAvaliacoes", listaAvaliacoes);
	return TELA_LISTAR;
    }
    
    @RequestMapping("/inscricao/aprovarAvaliacao")
    public String aprovarAvaliacao(@RequestParam Long id, Model model) {

	Avaliacao avaliacao = avaliacaoDao.find(id);
	avaliacao.setAprovada(true);
	avaliacaoDao.aprovarAvaliacao(avaliacao);
	model.addAttribute("mensagem", "Avaliação aprovada com sucesso!");

	return "forward:viewEvaluations";
    }

}
