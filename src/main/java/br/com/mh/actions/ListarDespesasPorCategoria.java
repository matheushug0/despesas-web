package br.com.mh.actions;

import br.com.mh.dao.DespesaDAO;
import br.com.mh.model.Categoria;
import br.com.mh.model.Despesa;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListarDespesasPorCategoria implements Action{
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DespesaDAO dao = new DespesaDAO();
        List<Despesa> despesas = dao.findByCategoria(Categoria.valueOf(req.getParameter("categoria")));

        req.setAttribute("despesas", despesas);

        return "/WEB-INF/listar-despesas.jsp";
    }
}
