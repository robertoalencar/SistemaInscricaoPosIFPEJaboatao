package main.br.org.ifpe.inscricaopos.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
	    throws Exception {

	String uri = request.getRequestURI();
	if (uri.contains("resources") || uri.endsWith("inscricao-pos-jaboatao") || uri.endsWith("efetuarLogin")) {

	    request.getSession().setAttribute("msg", null);
	    return true;
	}

	if (request.getSession().getAttribute(Constantes.USUARIO_SESSAO) != null) {
	    
	    request.getSession().setAttribute("msg", null);
	    return true;
	}

	request.getSession().setAttribute("msg", "É necessário informar as credencias de acesso para acessar o sistema.");
	response.sendRedirect("/inscricao-pos-jaboatao");
	return false;
    }
}
