package br.com.mh.actions;

import br.com.mh.dao.DespesaDAO;
import br.com.mh.model.Categoria;
import br.com.mh.model.Despesa;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class AtualizarDespesa implements Action{
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String descricao = req.getParameter("descricao");
        String data = req.getParameter("data");
        String valor = req.getParameter("valor").contains(",") ?  req.getParameter("valor").replace(".","").replace(",",".") : req.getParameter("valor");
        String categoria = req.getParameter("categoria");
        Long id = Long.parseLong(req.getParameter("id"));

        System.out.println(descricao);
        System.out.println("Data" + data);
        System.out.println(valor);
        System.out.println(categoria);
        System.out.println(id);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(data, formatter);

        System.out.println("Data Formatada" + date);

        DespesaDAO dao = new DespesaDAO();
        Despesa despesa = new Despesa(descricao, date, new BigDecimal(valor), Categoria.valueOf(categoria));
        Despesa update = dao.update(despesa, id);

        System.out.println("Update: " + update.getData());

        req.setAttribute("update", update);

        return "/controller?action=BuscarDespesa&id=" + update.getId();
    }
}
