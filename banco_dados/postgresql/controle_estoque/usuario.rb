class Usuario < ActiveRecord::Base
    # Definindo a tabela corespondente no banco de dados (pluralizada por padrão )
    self.table_name = 'usuarios'
end

