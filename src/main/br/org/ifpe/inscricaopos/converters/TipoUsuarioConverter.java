package main.br.org.ifpe.inscricaopos.converters;

import org.springframework.core.convert.converter.Converter;

import main.br.org.ifpe.inscricaopos.dao.UsuarioDao;
import main.br.org.ifpe.inscricaopos.entidade.TipoUsuario;

public class TipoUsuarioConverter implements Converter<String, TipoUsuario> {

    public TipoUsuario convert(String id) {

	return (TipoUsuario) new UsuarioDao().find(TipoUsuario.class, Integer.valueOf(id));
    }
}
