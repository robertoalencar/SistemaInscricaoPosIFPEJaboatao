package main.br.org.ifpe.inscricaopos.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.br.org.ifpe.inscricaopos.dao.InscricaoDao;
import main.br.org.ifpe.inscricaopos.entidade.Candidato;
import main.br.org.ifpe.inscricaopos.entidade.Inscricao;

/**
 * @author Roberto Alencar
 *
 */
@Controller
public class InscricaoController {

    public static final String TELA_MANTER = "inscricao/inscricaoSave";
    public static final String TELA_LISTAR = "inscricao/inscricaoList";
    public static final String TELA_AVALIAR = "inscricao/inscricaoAvaliar";

    @RequestMapping("/inscricao/list")
    public String list(Model model) {

	return TELA_LISTAR;
    }

    @RequestMapping(value = "/inscricao/ordenarRegistros", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Inscricao> ordenarRegistros(@RequestParam String criterioOrdenacao,
	    @RequestParam String ordem) {

	return new InscricaoDao().listar(criterioOrdenacao, ordem);
    }

    @RequestMapping(value = "/inscricao/filter", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Inscricao> filter(@RequestParam String numInscricao, @RequestParam String nome) {

	return new InscricaoDao().filtrar(numInscricao, nome);
    }

    @RequestMapping("/inscricao/add")
    public String add(Model model) {

	model.addAttribute("operacao", "save");
	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/save")
    public String save(Candidato candidato, @RequestParam String cursoEscolhido, Model model) {

	model.addAttribute("inscricao", new InscricaoDao().save(candidato, cursoEscolhido));
	model.addAttribute("mensagem", "Inscrição inserida com sucesso!");

	return "forward:add";
    }

    @RequestMapping("/inscricao/edit")
    public String edit(@RequestParam Integer id, Model model) {

	model.addAttribute("inscricao", new InscricaoDao().find(Inscricao.class, id));
	model.addAttribute("operacao", "update");

	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/update")
    public String update(Candidato candidato, @RequestParam int idInscricao, @RequestParam String cursoEscolhido, Model model) {

	InscricaoDao dao = new InscricaoDao();
	
	Inscricao inscricao = (Inscricao) dao.find(Inscricao.class, idInscricao);
	inscricao.setCursoEscolhido(cursoEscolhido);
	
	dao.update(candidato, inscricao);
	
	model.addAttribute("mensagem", "Inscrição atualizada com sucesso!");
	model.addAttribute("inscricao", dao.obterInscricaoCandidato(candidato.getId()));
	model.addAttribute("operacao", "update");

	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/delete")
    public String delete(@RequestParam Integer id, Model model) {

	new InscricaoDao().remove(id);
	model.addAttribute("mensagem", "Inscrição Removida com Sucesso");

	return "forward:list";
    }

    @RequestMapping("/inscricao/view")
    public String view(@RequestParam Integer id, Model model) {

	model.addAttribute("inscricao", new InscricaoDao().find(Inscricao.class, id));
	model.addAttribute("operacao", "view");

	return TELA_MANTER;
    }

    @RequestMapping("/inscricao/avaliar")
    public String avaliar(@RequestParam Integer id, Model model) {

	model.addAttribute("inscricao", new InscricaoDao().find(Inscricao.class, id));

	return TELA_AVALIAR;
    }

}
