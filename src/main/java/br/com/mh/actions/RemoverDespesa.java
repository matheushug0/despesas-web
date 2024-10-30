package br.com.mh.actions;

import br.com.mh.dao.DespesaDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RemoverDespesa implements Action{
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DespesaDAO dao = new DespesaDAO();

        Long id = Long.parseLong(req.getParameter("id"));
        dao.delete(id);

        return "/controller?action=ListarDespesas";
    }
}
