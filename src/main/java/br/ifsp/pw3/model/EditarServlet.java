package br.ifsp.pw3.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ifsp.pw3.model.dao.UsuarioDao;
import br.ifsp.pw3.model.domain.Usuario;

@WebServlet(name = "editar", value = "/editar")
public class EditarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String usuario = req.getParameter("usuario");

        UsuarioDao usuarioDao = new UsuarioDao();
        Usuario usuarioEditado = usuarioDao.getUsuarioByUsuario(usuario);

        if (usuarioEditado != null) {
            HttpSession session = req.getSession();
            session.setAttribute("usuarioEditado", usuarioEditado);

            resp.sendRedirect("editarUsuario.jsp");
        } else {
            resp.sendRedirect("listaUsuario.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Usuario usuarioEditado = new Usuario();

        usuarioEditado.setId(Integer.parseInt(req.getParameter("id")));
        usuarioEditado.setUsuario(req.getParameter("usuario"));
        usuarioEditado.setSenha(req.getParameter("senha"));
        usuarioEditado.setNome(req.getParameter("nome"));

        UsuarioDao usuarioDao = new UsuarioDao();
        usuarioDao.alterar(usuarioEditado);

        resp.sendRedirect("listaUsuario.jsp");
    }
}
