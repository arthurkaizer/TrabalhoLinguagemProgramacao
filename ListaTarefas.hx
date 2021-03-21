import haxe.xml.Access;

class Data {
    @:isVar private var dia(get,set):Int;//Habilitado Metodos get e set
    @:isVar private var mes(get,set):Int;//Habilitado Metodos get e set
    @:isVar private var ano(get,set):Int;//Habilitado Metodos get e set

    public function new(dia:Int,mes:Int,ano:Int) {
        this.dia = dia;
        this.mes = mes;
        this.ano = ano;
    }
    private function set_dia(val:Int): Int {
        this.dia = val;
        return val;
    }
    public function get_dia(){
        return dia;
    }
    private  function set_mes(val:Int): Int {
        this.mes = val;
        return val;
    }
    public function get_mes(){
        return mes;
    }
    private function set_ano(val:Int): Int {
        this.ano = val;
        return val;
    }
    public function get_ano(){
        return ano;
    }

    public function set_Data(d:Int,m:Int,a:Int) : Void{
        set_dia(d);
        set_mes(m);
        set_ano(a);
    }

}

class Tarefas {
    // @isVar força o campo a ser físico, permitindo que o programa seja compilado.
    @:isVar private var id(get,set):Int; //Habilitado Metodos get e set
    private var descricao(default, null):String; // somente leitura pública habilitada
    @:isVar private var disciplina(get,set):String;//Habilitado Metodos get e set
    private var data:Data;
    public var subtarefas:Array<String> = [];

    public function new(id:Int,descricao:String,disciplina:String,dia:Int,mes:Int,ano:Int) {
        data = new Data(0,0,0);
        this.id = id;
        this.descricao = descricao;
        this.disciplina = disciplina;
        this.data.set_Data(dia,mes,ano);
    }
    public function set_id(val:Int) : Int {
        this.id = val;
        return val;
    }
    public function get_id() {
        return id;
    }
    public function set_descricao(val:String) : String {
        descricao = val;
        return val;
    }
    public function get_descricao() {
        return descricao;
    }
    public function set_disciplina(val:String) : String {
        this.disciplina = val;
        return val;
    }
    public function get_disciplina() {
        return disciplina;
    }
    public  function adicionarSubtarefa(subtarefa:String) : String {
        
        var numSubtarefas:Int =  subtarefas.push(subtarefa);
        return '$descricao tem $numSubtarefas subtarefas';
    }
    public function alterarDataConclusao(d:Int,m:Int,a:Int) {
        this.data.set_Data(d,m,a);
    }

    public  function toString() {
        return 'Id-> $id Descrição-> $descricao Disciplina-> $disciplina'; //interpolação de String
    }
}

class ListaTarefas {
    public static function main() {
        
        trace("Lista de Tarefas");
        var tarefa1 = new Tarefas(1,"Atividade 3 - Arvores","AED 3",20,10,2020);
        var tarefas = new Array();
        tarefas.push(tarefa1);
        trace(tarefas);
        tarefa1.set_id(2);
        tarefa1.set_descricao("Relatorio 4");
        tarefa1.set_disciplina("Arquitetura de Computadores 2");
        tarefas.push(tarefa1);
        trace(tarefas);
                
        trace(tarefa1.adicionarSubtarefa("Parte 1 - ULA 4 bits"));
        trace(tarefas);
    }
}