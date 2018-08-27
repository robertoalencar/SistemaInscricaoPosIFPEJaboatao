package main.br.org.ifpe.inscricaopos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import main.br.org.ifpe.inscricaopos.dao.InscricaoDao;
import main.br.org.ifpe.inscricaopos.entidade.Candidato;

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
}
