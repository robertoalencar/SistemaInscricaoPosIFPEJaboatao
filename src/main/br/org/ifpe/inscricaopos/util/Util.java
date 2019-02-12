package main.br.org.ifpe.inscricaopos.util;

import java.util.Calendar;

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

}
