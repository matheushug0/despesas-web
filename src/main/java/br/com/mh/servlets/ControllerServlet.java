package br.com.mh.servlets;

import br.com.mh.actions.Action;
import br.com.mh.actions.AdicionarDespesa;
import br.com.mh.actions.ListarDespesas;
import br.com.mh.actions.RemoverDespesa;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // As concatenação das duas String irá formar o endereço da Classe a ser instanciada
        String action = req.getParameter("action");
        String pkg = "br.com.mh.actions.";

        // Refatoração Usando Polimorfismo
        try {
            //Retorna um Class Object associado ao caminho passado nas Strings
            Class c = Class.forName(pkg + action);

            //Instanciação da Classe usando Polimorfismo da Interface, pois todas as classes de `actions`
            // implementam a Interface Action
            Action a = (Action) c.newInstance();

            String getDispatcher = a.execute(req, resp);

            req.getRequestDispatcher(getDispatcher).forward(req, resp);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
