class Bar
    def foo
        $global = 0
        puts $global
    end
end

#A classe 'Baz' altera o método '$global' da classe 'Bar'
class Baz
    def qux
        $global += 1
        puts $global
    end
end

bar = Bar.new
baz = Baz.new
bar.foo #imprime 0
baz.qux #imprime 1, pois o método '$global' na classe 'Baz' recebeu 1
baz.qux #imprime 2, pois o método '$global' na classe 'Baz' foi incrementado + 1
puts $global #imprime 2, pois o método $global, na verdade, era um método visível
#tanto para a classe 'Bar' quanto para a classe 'Baz'. Por ser uma variável global,
#ela foi alterada em '$global += 1' e posteriormente com a incrementação.

$global = 123456 #novamente o variável '$global' será alterada sem a necessidade de
#utilizar uma classe para isso.
puts $global