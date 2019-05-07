package main.br.org.ifpe.inscricaopos.converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import main.br.org.ifpe.inscricaopos.dao.UsuarioDao;
import main.br.org.ifpe.inscricaopos.domain.TipoUsuario;

public class TipoUsuarioConverter implements Converter<String, TipoUsuario> {

    @Autowired
    private UsuarioDao usuarioDao;

    public TipoUsuario convert(String id) {

	return usuarioDao.findTipoUsuario(Long.valueOf(id));
    }
}
