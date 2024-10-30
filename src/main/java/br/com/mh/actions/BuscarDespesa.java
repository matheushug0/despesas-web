package br.com.mh.actions;

import br.com.mh.dao.DespesaDAO;
import br.com.mh.model.Despesa;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

public class BuscarDespesa implements Action{
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DespesaDAO dao = new DespesaDAO();
        Long id = Long.parseLong(req.getParameter("id"));

        Optional<Despesa> despesa = dao.findById(id);

        req.setAttribute("despesa", despesa.get());

        return "/WEB-INF/buscar-despesa.jsp";
    }
}
