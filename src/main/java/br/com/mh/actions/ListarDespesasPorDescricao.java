package br.com.mh.actions;

import br.com.mh.dao.DespesaDAO;
import br.com.mh.model.Despesa;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListarDespesasPorDescricao implements Action{
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DespesaDAO dao = new DespesaDAO();
        List<Despesa> despesas = dao.findByDespesaLike(req.getParameter("descricao"));

        req.setAttribute("despesas", despesas);

        return "/WEB-INF/listar-despesas.jsp";
    }
}
