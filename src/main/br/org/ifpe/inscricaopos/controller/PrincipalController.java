package main.br.org.ifpe.inscricaopos.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import main.br.org.ifpe.inscricaopos.dao.InscricaoDao;
import main.br.org.ifpe.inscricaopos.dao.UsuarioDao;
import main.br.org.ifpe.inscricaopos.domain.Usuario;
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
    private InscricaoDao inscricaoDao;

    @Autowired
    private UsuarioDao usuarioDao;

    @RequestMapping("/home")
    public String home(Model model) {

	model.addAttribute("listaInscricoes", inscricaoDao.listar(null, null));
	return TELA_HOME;
    }

    @RequestMapping("/efetuarLogin")
    public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {

	usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
	Usuario usuarioLogado = usuarioDao.buscarUsuario(usuario);

	if (usuarioLogado != null) {
	    session.setAttribute(Constantes.USUARIO_SESSAO, usuarioLogado);
	    model.addAttribute("listaInscricoes", inscricaoDao.listar(null, null));
	    return TELA_HOME;
	}

	model.addAttribute("msg", "Não foi encontrado um usuário com o login e senha informados.");
	return TELA_INDEX;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {

	session.setAttribute(Constantes.USUARIO_SESSAO, null);
	return TELA_INDEX;
    }

}
