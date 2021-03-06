package main.br.org.ifpe.inscricaopos.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import main.br.org.ifpe.inscricaopos.domain.Usuario;

public class Util {

    public static String obterMomentoAtual() {

	Calendar c = Calendar.getInstance();

	int ano = c.get(Calendar.YEAR);
	int mes = c.get(Calendar.MONTH);
	int dia = c.get(Calendar.DAY_OF_MONTH);
	int hora = c.get(Calendar.HOUR_OF_DAY);
	int minuto = c.get(Calendar.MINUTE);
	int segundo = c.get(Calendar.SECOND);

	String momentoUpload = ano + "-" + (mes + 1) + "-" + dia + "-" + hora + "-" + minuto + "-" + segundo;

	return momentoUpload;
    }

    public static Date converterData(String param) {

	Date retorno = null;
	DateFormat data = DateFormat.getDateInstance();

	try {
	    data.parse(param);
	    retorno = data.getCalendar().getTime();
	} catch (ParseException e) {
	    e.printStackTrace();
	}

	return retorno;
    }

    public static String converterData(Date param) {

	if (param != null) {
	    return new SimpleDateFormat("dd/MM/yyyy").format(param);
	} else {
	    return "";
	}
    }
    
    public static boolean validaPerfilUsuario(HttpSession session, long[] autorizacao) {

	boolean permiteAcesso = false;
	
	Usuario usuarioLogado = (Usuario) session.getAttribute(Constantes.USUARIO_SESSAO);
	for (int i = 0; i < autorizacao.length; i++) {
	
	    if (autorizacao[i] == usuarioLogado.getTipo().getId()) {
		permiteAcesso = true;
	    }
	}
	
	return permiteAcesso;
    }

}
