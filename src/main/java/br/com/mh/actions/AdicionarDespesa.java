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

public class AdicionarDespesa implements Action{
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String descricao = req.getParameter("descricao");
        String data = req.getParameter("data");
        String valor = req.getParameter("valor").replace(".","").replace(",",".");
        String categoria = req.getParameter("categoria");

        System.out.println(descricao);
        System.out.println(data);
        System.out.println(valor);
        System.out.println(categoria);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(data, formatter);

        DespesaDAO dao = new DespesaDAO();
        Despesa despesa = new Despesa(descricao, date, new BigDecimal(valor), Categoria.valueOf(categoria));

        Despesa res = dao.save(despesa);

        req.setAttribute("despesa", res);

        //Permite encaminhar uma requisição para uma arquivo .jsp
        return "/adiciona-despesa.jsp";
    }
}
