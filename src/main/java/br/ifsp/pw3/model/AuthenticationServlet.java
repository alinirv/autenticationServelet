package br.ifsp.pw3.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ifsp.pw3.model.dao.UsuarioDao;


@WebServlet(name = "autenticar", value = "/autenticar")
public class AuthenticationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        String usuario = req.getParameter("usuario");
        String senha = req.getParameter("senha");

        UsuarioDao usuarioDao = new UsuarioDao();
        boolean autenticado = usuarioDao.autenticar(usuario, senha);

        if (autenticado) {
            
            resp.sendRedirect("listaUsuario.jsp");
        } else {
            
            resp.sendRedirect("erro.jsp");
        }
    }
}
