package main.br.org.ifpe.inscricaopos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import main.br.org.ifpe.inscricaopos.dao.InscricaoDao;

/**
 * @author Roberto Alencar
 *
 */
@Controller
public class PrincipalController {

    @RequestMapping("/home")
    public String home(Model model) {

	model.addAttribute("listaInscricoes", new InscricaoDao().listar());
	return "principal/home";
    }

}
