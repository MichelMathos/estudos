# Criar novo usuário
def create
    @novo_usuario = Usuario.new(usuario_params)

    if @novo_usuario.save
        # Redirecionar para a página de detalhes do usuário recém-criado
        redirect_to usuario_path(@novo_usuario), notice: 'Usuario criado com sucesso!'
    else
        # Renderizar o formulario de criação novamente em caso de erros
        render :new
    end
end