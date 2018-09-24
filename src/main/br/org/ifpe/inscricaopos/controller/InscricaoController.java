package main.br.org.ifpe.inscricaopos.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import main.br.org.ifpe.inscricaopos.dao.InscricaoDao;
import main.br.org.ifpe.inscricaopos.entidade.Candidato;
import main.br.org.ifpe.inscricaopos.entidade.Inscricao;

/**
 * @author Roberto Alencar
 *
 */
@Controller
public class InscricaoController {

    private static final String TELA_MANTER_INSCRICAO = "inscricao/manterInscricao";
    private static final String TELA_LISTAR_INSCRICAO = "inscricao/listarInscricao";

    @RequestMapping("/inscricao/list")
    public String list(Model model) {

	model.addAttribute("lista", new InscricaoDao().listar(null, null));
	return TELA_LISTAR_INSCRICAO;
    }

    @RequestMapping(value = "/inscricao/filter", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String filter(@RequestParam String criterioOrdenacao, @RequestParam String ordem) {

	List<Inscricao> lista = new InscricaoDao().listar(criterioOrdenacao, ordem);
	return new Gson().toJson(lista);
    }

    @RequestMapping("/inscricao/add")
    public String add(Model model) {

	model.addAttribute("operacao", "save");
	return TELA_MANTER_INSCRICAO;
    }

    @RequestMapping("/inscricao/save")
    public String save(Candidato candidato, Model model) {

	InscricaoDao inscricaoDao = new InscricaoDao();
	Inscricao inscricao = inscricaoDao.salvarInscricao(candidato);
	model.addAttribute("inscricao", inscricao);
	model.addAttribute("mensagem", "Inscrição inserida com sucesso!");

	return "forward:add";
    }

    @RequestMapping("/inscricao/edit")
    public String edit(@RequestParam("id") Integer id, Model model) {

	Inscricao inscricao = (Inscricao) new InscricaoDao().find(id);
	model.addAttribute("inscricao", inscricao);
	model.addAttribute("operacao", "update");

	return TELA_MANTER_INSCRICAO;
    }

    @RequestMapping("/inscricao/update")
    public String update(Candidato candidato, Model model) {

	InscricaoDao dao = new InscricaoDao();

	dao.update(candidato);
	model.addAttribute("mensagem", "Inscrição atualizada com sucesso!");
	model.addAttribute("inscricao", dao.obterInscricaoCandidato(candidato.getId()));
	model.addAttribute("operacao", "update");

	return TELA_MANTER_INSCRICAO;
    }

    @RequestMapping("/inscricao/delete")
    public String delete(@RequestParam("id") Integer id, Model model) {

	new InscricaoDao().remove(id);
	model.addAttribute("mensagem", "Inscrição Removida com Sucesso");

	return "forward:list";
    }
}
