package main.br.org.ifpe.inscricaopos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
