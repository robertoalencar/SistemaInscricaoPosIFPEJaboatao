package main.br.org.ifpe.inscricaopos.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.br.org.ifpe.inscricaopos.dao.UsuarioDao;
import main.br.org.ifpe.inscricaopos.entidade.TipoUsuario;
import main.br.org.ifpe.inscricaopos.entidade.Usuario;
import main.br.org.ifpe.inscricaopos.util.Constantes;
import main.br.org.ifpe.inscricaopos.util.Criptografia;

/**
 * @author Roberto Alencar
 *
 */
@Controller
public class UsuarioController {

    public static final String TELA_MANTER = "usuario/usuarioSave";
    public static final String TELA_LISTAR = "usuario/usuarioList";
    public static final String TELA_CHANGE_PASS = "usuario/changePassword";
    public static final String TELA_DADOS_USUARIO = "usuario/dadosUsuario";

    @RequestMapping("/usuario/list")
    public String list(Model model) {

	model.addAttribute("listaTipoUsuario", new UsuarioDao().list(TipoUsuario.class.getName(), "descricao", null));
	return TELA_LISTAR;
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/usuario/ordenarRegistros", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Usuario> ordenarRegistros(@RequestParam String criterioOrdenacao,
	    @RequestParam String ordem) {

	return (List<Usuario>) new UsuarioDao().list(Usuario.class.getName(), criterioOrdenacao, ordem);
    }

    @RequestMapping(value = "/usuario/filter", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Usuario> filter(@RequestParam Integer tipoUsuarioId, @RequestParam String nome) {

	return new UsuarioDao().filtrar(tipoUsuarioId, nome);
    }

    @RequestMapping("/usuario/add")
    public String add(Model model) {

	model.addAttribute("listaTipoUsuario", new UsuarioDao().list(TipoUsuario.class.getName(), "descricao", null));
	model.addAttribute("operacao", "save");
	return TELA_MANTER;
    }

    @RequestMapping("/usuario/save")
    public String save(Usuario usuario, Model model) {

	usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
	model.addAttribute("usuario", new UsuarioDao().save(usuario));
	model.addAttribute("mensagem", "Usuário inserido com sucesso!");

	return "forward:add";
    }

    @RequestMapping("/usuario/edit")
    public String edit(@RequestParam Integer id, Model model) {

	model.addAttribute("usuario", new UsuarioDao().find(Usuario.class, id));
	model.addAttribute("listaTipoUsuario", new UsuarioDao().list(TipoUsuario.class.getName(), "descricao", null));
	model.addAttribute("operacao", "update");

	return TELA_MANTER;
    }

    @RequestMapping("/usuario/update")
    public String update(Usuario usuario, Model model) {

	new UsuarioDao().update(usuario);
	model.addAttribute("mensagem", "Usuário atualizado com sucesso!");
	model.addAttribute("operacao", "update");
	model.addAttribute("listaTipoUsuario", new UsuarioDao().list(TipoUsuario.class.getName(), "descricao", null));

	return TELA_MANTER;
    }

    @RequestMapping("/usuario/delete")
    public String delete(@RequestParam Integer id, Model model) {

	new UsuarioDao().remove(new int[] { id });
	model.addAttribute("mensagem", "Usuário Removido com Sucesso");

	return "forward:list";
    }

    @RequestMapping("/usuario/view")
    public String view(@RequestParam Integer id, Model model) {

	model.addAttribute("usuario", new UsuarioDao().find(Usuario.class, id));
	model.addAttribute("listaTipoUsuario", new UsuarioDao().list(TipoUsuario.class.getName(), "descricao", null));
	model.addAttribute("operacao", "view");

	return TELA_MANTER;
    }

    @RequestMapping("/changePasswordView")
    public String changePasswordView() {

	return TELA_CHANGE_PASS;
    }

    @RequestMapping("/changePassword")
    public String changePassword(@RequestParam String senhaAtual, @RequestParam String novaSenha,
	    @RequestParam String confirmaSenha, HttpSession session, Model model) {

	Usuario usuarioLogado = (Usuario) session.getAttribute(Constantes.USUARIO_SESSAO);
	usuarioLogado.setSenha(Criptografia.criptografar(senhaAtual));
	
	Usuario usuario = new UsuarioDao().buscarUsuario(usuarioLogado);
	if (usuario != null) {
	    
	    if (!novaSenha.equals(confirmaSenha)) {
		
		model.addAttribute("tipoMensagem", "alert alert-error");
		model.addAttribute("mensagem", "A senha informada no campo 'Nova Senha' é diferente da senha informada no campo 'Confirme a Senha'.");
		
	    } else {
		
		usuarioLogado.setSenha(Criptografia.criptografar(novaSenha));
		new UsuarioDao().update(usuarioLogado);
		session.setAttribute(Constantes.USUARIO_SESSAO, usuarioLogado);
		
		model.addAttribute("tipoMensagem", "alert alert-success alert-dismissible");
		model.addAttribute("mensagem", "Senha atualizada com sucesso!");
	    }
	    
	} else {
	    
	    model.addAttribute("tipoMensagem", "alert alert-error");
	    model.addAttribute("mensagem", "A senha informada no campo 'Senha Atual' é diferente da senha do usuário logado.");
	}
	
	return TELA_CHANGE_PASS;
    }
    
    @RequestMapping("/dadosUsuario")
    public String dadosUsuario() {

	return TELA_DADOS_USUARIO;
    }

}