package br.ifsp.pw3.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ifsp.pw3.model.dao.UsuarioDao;

@WebServlet(name = "excluir", value = "/excluir")
public class ExcluirServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String idString = req.getParameter("id");

        if (idString != null && !idString.isEmpty()) {
            int id = Integer.parseInt(idString);

            UsuarioDao usuarioDao = new UsuarioDao();

            usuarioDao.excluir(id);
        }
        resp.sendRedirect("listaUsuario.jsp");
    }
}
