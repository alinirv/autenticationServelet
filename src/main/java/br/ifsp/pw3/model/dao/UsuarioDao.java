package br.ifsp.pw3.model.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.ifsp.pw3.model.domain.Usuario;

public class UsuarioDao {

    // Cria a tabela para usuários
    public void criarTabela() {
        String sql = "CREATE TABLE IF NOT EXISTS usuarios( " +
                "id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, " +
                "usuario VARCHAR(40) NOT NULL, " +
                "senha VARCHAR(40) NOT NULL, " +
                "nome VARCHAR(100) NOT NULL)";

        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Insere dados na tabela de usuários
    public void inserir(Usuario usuario) {
        String sql = "INSERT INTO usuarios(usuario, senha, nome) VALUES(?, ?, ?)";

        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setString(1, usuario.getUsuario());
            stmt.setString(2, hashPassword(usuario.getSenha()));
            stmt.setString(3, usuario.getNome());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void excluir(int id) {
        String sql = "DELETE FROM usuarios WHERE id=?";

        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void alterar(Usuario usuario) {
        String sql = "UPDATE usuarios SET usuario=?, senha=?, nome=? WHERE id=?";

        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setString(1, usuario.getUsuario());
            stmt.setString(2, hashPassword(usuario.getSenha()));
            stmt.setString(3, usuario.getNome());
            stmt.setInt(6, usuario.getId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Usuario> listar() {
        ArrayList<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";

        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario(
                        rs.getInt("id"),
                        rs.getString("usuario"),
                        rs.getString("senha"),
                        rs.getString("nome"));
                lista.add(usuario);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public Usuario getUsuario(int id) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE id=?";

        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                usuario = new Usuario(
                        rs.getInt("id"),
                        rs.getString("usuario"),
                        rs.getString("senha"),
                        rs.getString("nome"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    public Usuario getUsuarioByUsuario(String usuario) {
        Usuario usuarioEncontrado = null;
        String sql = "SELECT * FROM usuarios WHERE usuario=?";

        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setString(1, usuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                usuarioEncontrado = new Usuario(
                    rs.getInt("id"),
                    rs.getString("usuario"),
                    rs.getString("senha"),
                    rs.getString("nome"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarioEncontrado;
    }

    public boolean autenticar(String usuario, String senha) {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE usuario=? AND senha=?";

        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setString(1, usuario);
            stmt.setString(2, hashPassword(senha));
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        
        return null;
    }
}
