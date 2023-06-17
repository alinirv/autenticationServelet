package br.ifsp.pw3.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ifsp.pw3.model.dao.UsuarioDao;
import br.ifsp.pw3.model.domain.Usuario;

@WebServlet(name = "cadastro", value = "/cadastro")
public class CadastroServlet extends HttpServlet {
    
    @Override
    public void init() throws ServletException {
        UsuarioDao dao = new UsuarioDao();
        dao.criarTabela();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        String usuario = req.getParameter("usuario");
        String senha = req.getParameter("senha");
        String nome = req.getParameter("nome");

        Usuario novoUsuario = new Usuario(id, usuario, senha, nome);
        UsuarioDao dao = new UsuarioDao();

        dao.inserir(novoUsuario);
        
        resp.sendRedirect("autenticar.jsp");
    }

    
}
