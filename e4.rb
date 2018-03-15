=begin
  Ejercicio #4 de La Tarea sobre Ruby
  Autores: Andrés Buelvas 13-10184
          Miguel Canedo 13-10214
  Fecha: 14/03/18
=end

# Modulo DFS donde se generalizan dos metodos de recorrido para las clases
# ArbolBinario y GrafoDirigido.
module DFS
  # Metodo que se encarga de buscar en la estructura, comenzando desde 'start',
  # el primer elemento que cumpla el 'predicate' y lo devuelve.
  # En caso de que nadie cumpla el 'predicate', retorna 'nil'.
  def find(start, predicate, visited = [])
    visited << start     # Marcamos a 'start' como visitado.
    encontrado = nil

    # Si 'start' cumple la condicion del predicate, lo retornamos a el.
    if predicate.call(start.dato)
      return start.dato
    end

    # Recorremos todos los nodos o vertices que le siguen a 'start'.
    start.siguientes.each do |n|
      next if visited.include?(n)        # Si fue visitado se ignora.
      if n
        encontrado = find(n, predicate, visited)    # Se sigue la recursion ahora con 'n' como 'start'.
        break if encontrado
      end
    end

    # Retornamos el vertice o nodo encontrado, o 'nil'.
    encontrado
  end

  # Metodo que se encarga de buscar en la estructura, comenzando desde 'start',
  # el primer elemento que cumpla el 'predicate' y devuelve el camino hacia el mismo.
  # En caso de que nadie cumpla el 'predicate', retorna 'nil'.
  def path(start, predicate, visited = [], p = [])
    pEncontrado = nil
    visited << start    # Marcamos a 'start' como visitado.

    # Agregamos el vertice 'start' al camino.
    pathNuevo = p.clone()
    pathNuevo << start

    # Si 'start' cumple la condicion del predicate, se retorna el camino encontrado hasta el.
    if predicate.call(start.dato)
      return pathNuevo
    end

    # Recorremos todos los nodos o vertices que le siguen a 'start'.
    start.siguientes.each do |n|
      next if visited.include?(n)     # Si fue visitado se ignora.
      if n
        pEncontrado = path(n, predicate, visited, pathNuevo)    # Se sigue la recursion ahora con 'n' como 'start'.
        break if pEncontrado
      end
    end

    # Retornamos el camino encontrado, o 'nil'.
    pEncontrado
  end
end

# Clase ArbolBinario representa un Arbol Binario de Busqueda sencillo.
# Incluye los metodos del Modulo DFS.
class ArbolBinario
  include DFS

  attr_accessor :root

  # Clase Nodo que se encarga de almacenar los datos de un Arbol Binario
  # ademas de sus hijos en dicho Arbol.
  class Nodo
    attr_accessor :dato, :izq, :der

    # Metodo inicilizador de la clase Nodo.
    def initialize r
      @dato = r     # Dato que almacena el Nodo.
      @izq = nil     # Hijo Izquierdo del Nodo.
      @der = nil    # Hijo Derecho del Nodo.
    end

    # Metodo que devuelve los hijos de Nodo empaquetados en un arreglo.
    def siguientes
      [@izq, @der]
    end

    # Metodo que devuleve la representacion en String de la clase Nodo.
    def to_s
      "#{dato}"
    end
  end

  # Metodo Inicilizador de la clase ArbolBinario.
  def inicialize
    @root = nil # Raiz del ArbolBinario.
  end

  # Metodo que inserta de manera ordenada un nuevo elemento en el Arbol Binario.
  def insertar (nuevo, nodo = @root)
    if @root
      if nodo.dato >= nuevo
        if nodo.izq
          insertar(nuevo, nodo.izq)
        else
          nodo.izq = Nodo.new(nuevo)
        end
      else
        if nodo.der
          insertar(nuevo, nodo.der)
        else
          nodo.der = Nodo.new(nuevo)
        end
      end
    else
      @root = Nodo.new(nuevo)
    end
  end

  # Metodo que devuleve la representacion en String de la clase ArbolBinario.
  def to_s
    nodos = [@root]
    s = "Arbol Binario: "
    while !nodos.empty?
      s = s + nodos[0].to_s + " "

      nodos << nodos[0].izq if nodos[0].izq
      nodos << nodos[0].der if nodos[0].der

      nodos = nodos.drop(1)
    end

    s
  end

end

# Clase GrafoDirigido representa un Grafo donde sus lados posee una direccion unica.
# Incluye los metodos del Modulo DFS.
class GrafoDirigido
  include DFS

  attr_accessor :vertices

  # Clase Vertice que se encarga de almacenar los datos de un Grafo Dirigido,
  # ademas de los vertices a los que se dirige.
  class Vertice
    attr_accessor :dato, :vecinos

    # Metodo inicilizador de la clase Veritice.
    def initialize(dato)
      @dato = dato     # Dato que almacena el Vertice.
      @vecinos = []    # Vertices a los que se dirige este.
    end

    # Metodo que devuelve el arreglo de Vertices a destinos desde este.
    def siguientes
      @vecinos
    end

    # Metodo que devuleve la representacion en String de la clase Vertice.
    def to_s
      "#{dato}"
    end

  end

  # Metodo inicilizador de la clase GrafoDirigido.
  def initialize
    @vertices = []
  end

  # Metodo que agrega un Vertice al Grafo.
  def agregarVertice(dato)
    @vertices << Vertice.new(dato)
  end

  # Metodo que agrega una Arista desde el Vertice 'origen'
  # hasta Vertice 'destino'.
  def agregarArista(origen, destino)
    desde = vertices.index { |v| v.dato == origen }
    hasta = vertices.index { |v| v.dato == destino }

    vertices[desde].vecinos << vertices[hasta]
  end

  # Metodo que devuleve la representacion en String de la clase GrafoDirigido.
  def to_s
    s = "Grafo Dirigido: "
    vertices.each { |v| s += v.to_s }
    s
  end
end


##
## Prueba de clases y de las funciones del Module DFS.
##

# Predicado que indica si un numero es impar.
pred = Proc.new { |x| x%2 != 0 }

###  Arbol Binario de Busqueda.
#       2
#      / \
#     2   6
#    /   / \
#   1   3   7
#
arbol = ArbolBinario.new()
arbol.insertar(2)
arbol.insertar(6)
arbol.insertar(3)
arbol.insertar(2)
arbol.insertar(1)
arbol.insertar(7)

puts "\nImpar en Arbol: "
puts arbol.find(arbol.root, pred)
puts "\nCamino hacia el: "
puts arbol.path(arbol.root, pred)
puts

### Grafo Dirigido.
#       6
#      / \
#     4 - 3
#      \ /
#       2
#
grafo = GrafoDirigido.new()

# Vertices
grafo.agregarVertice(6)
grafo.agregarVertice(2)
grafo.agregarVertice(3)
grafo.agregarVertice(4)


# Aristas
grafo.agregarArista(6,4)     # 6 -> 4
grafo.agregarArista(6,3)     # 6 -> 3
grafo.agregarArista(2,4)    # 2 -> 4
grafo.agregarArista(4,3)    # 4 -> 3
grafo.agregarArista(3,2)    # 3 -> 2


puts "\nImpar en Grafo: "
puts grafo.find(grafo.vertices[0], pred)
puts "\nCamino hacia el: "
puts grafo.path(grafo.vertices[0], pred)