package br.ifsp.pw3.model.domain;

public class Usuario {

    private int id;
    private String usuario;
    private String senha;
    private String nome;

    public Usuario(){
        id = -1;
        usuario = "";
        senha = "";
        nome = "";
    }

    public Usuario(int id, String usuario, String senha, String nome) {
        this.id = id;
        this.usuario = usuario;
        this.senha = senha;
        this.nome = nome;
    }

    public Usuario(String usuario, String senha, String nome) {
        this.usuario = usuario;
        this.senha = senha;
        this.nome = nome;
    }
    
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }    
    public String getUsuario() {
        return usuario;
    }
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    public String getSenha() {
        return senha;
    }
    public void setSenha(String senha) {
        this.senha = senha;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nomeCompleto) {
        this.nome = nomeCompleto;
    }


     @Override
    public String toString() {
        return "Usuario [id=" + id + ", usuario=" + usuario + ", senha=" + senha + ", nome=" + nome+ "]";
    }
}
