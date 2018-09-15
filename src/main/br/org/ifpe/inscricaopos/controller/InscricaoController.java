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

    @RequestMapping("/inscricao/add")
    public String add(Model model) {

	return "inscricao/salvarInscricao";
    }

    @RequestMapping("/inscricao/save")
    public String save(Candidato candidato, Model model) {

	InscricaoDao inscricaoDao = new InscricaoDao();
	String numeroInscricao = inscricaoDao.salvarInscricao(candidato);
	model.addAttribute("numeroInscricao", numeroInscricao);
	model.addAttribute("mensagem", "Inscrição inserida com sucesso!");

	return "inscricao/salvarInscricao";
    }

    @RequestMapping("/inscricao/list")
    public String list(Model model) {

	model.addAttribute("lista", new InscricaoDao().listar(null, null));
	return "inscricao/listarInscricao";
    }

    @RequestMapping(value = "/inscricao/filter", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String filter(@RequestParam String criterioOrdenacao, @RequestParam String ordem) {

	List<Inscricao> lista = new InscricaoDao().listar(criterioOrdenacao, ordem);

	return new Gson().toJson(lista);
    }

    @RequestMapping("/inscricao/delete")
    public String delete(@RequestParam("id") Integer id, Model model) {

	new InscricaoDao().remove(id);
	model.addAttribute("mensagem", "Inscrição Removida com Sucesso");

	return "forward:list";
    }
}
