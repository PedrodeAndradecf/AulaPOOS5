

import Foundation

class PapelMoeda {

    var valor: Int
    var quantidade: Int

    init(valor: Int, quantidade: Int) {
        self.valor = valor
        self.quantidade = quantidade
    }

    func getValor() -> Int {
        return valor
    }

    func getQuantidade() -> Int {
        return quantidade
    }
}
