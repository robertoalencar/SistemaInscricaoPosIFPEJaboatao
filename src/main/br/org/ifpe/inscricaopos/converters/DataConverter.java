package main.br.org.ifpe.inscricaopos.converters;

import java.util.Calendar;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * @author Roberto Alencar
 *
 */
public class DataConverter implements Converter<String, Date> {

    
    public Date convert(String data) {

	if (data != null && !data.equals("")) {

	    Calendar c = Calendar.getInstance();

	    int dia = Integer.parseInt(data.substring(0, 2));
	    int mes = Integer.parseInt(data.substring(3, 5));
	    int ano = Integer.parseInt(data.substring(6, 10));

	    c.set(ano, (mes - 1), dia, 0, 0, 0);

	    return c.getTime();
	    
	} else {
	    
	    return null;
	}

    }
}
