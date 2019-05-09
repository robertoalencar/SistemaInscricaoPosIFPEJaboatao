package main.br.org.ifpe.inscricaopos.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import main.br.org.ifpe.inscricaopos.domain.Avaliacao;
import main.br.org.ifpe.inscricaopos.domain.InscricoesVO;

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
    
    public static void definirStatusInscricao(List<Avaliacao> avaliacoes, InscricoesVO inscricaoVO) {
	
	if (avaliacoes == null || avaliacoes.isEmpty()) {
	    inscricaoVO.setStatus(InscricoesVO.STATUS_INSCRICAO_PENDENTE);
	} else {
	    
	    boolean temAprovacao = false;
	    
	    for (Avaliacao avaliacao : avaliacoes) {
		if (avaliacao.isAprovada()) {
		    temAprovacao = true;
		    break;
		}
	    }
	    
	    if (temAprovacao) {
		inscricaoVO.setStatus(InscricoesVO.STATUS_INSCRICAO_APROVADA);
	    } else {
		inscricaoVO.setStatus(InscricoesVO.STATUS_INSCRICAO_PENDENTE);
	    }
	}
    }
}
