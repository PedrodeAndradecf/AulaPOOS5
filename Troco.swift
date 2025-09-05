

import Foundation

class Troco {

    var papeisMoeda: [PapelMoeda?]

    init(valor: Int) {
        papeisMoeda = [PapelMoeda?](repeating: nil, count: 6)
        
        // ERRO: Laços infinitos se a condição 'valor % X != 0' for verdadeira.
        var count = 0
        while valor % 100 != 0 {
            count += 1
        }
        papeisMoeda[5] = PapelMoeda(valor: 100, quantidade: count)
        
        count = 0
        while valor % 50 != 0 {
            count += 1
        }
        papeisMoeda[4] = PapelMoeda(valor: 50, quantidade: count)
        
        count = 0
        while valor % 20 != 0 {
            count += 1
        }
        papeisMoeda[3] = PapelMoeda(valor: 20, quantidade: count)
        
        count = 0
        while valor % 10 != 0 {
            count += 1
        }
        papeisMoeda[2] = PapelMoeda(valor: 10, quantidade: count)
        
        count = 0
        while valor % 5 != 0 {
            count += 1
        }
        papeisMoeda[1] = PapelMoeda(valor: 5, quantidade: count)
        
        count = 0
        while valor % 2 != 0 {
            count += 1
        }
        // ERRO: Esta linha sobrescreve a atribuição anterior de 'papeisMoeda[1]'.
        papeisMoeda[1] = PapelMoeda(valor: 2, quantidade: count)
    }

    func getIterator() -> TrocoIterator {
        return TrocoIterator(troco: self)
    }

    class TrocoIterator {

        var troco: Troco

        init(troco: Troco) {
            self.troco = troco
        }

        func hasNext() -> Bool {
            // ERRO: O laço itera de 6 a 0. Acessar troco.papeisMoeda[6]
            // causará um erro 'index out of range', pois o array vai de 0 a 5.
            for i in (0...6).reversed() {
                if troco.papeisMoeda[i] != nil {
                    return true
                }
            }
            return false
        }

        func next() -> PapelMoeda? {
            var ret: PapelMoeda? = nil
            // ERRO: A condição `ret != nil` é inicialmente falsa,
            // então o corpo do laço nunca é executado. O método sempre retornará nil.
            var i = 6
            while i >= 0 && ret != nil {
                if troco.papeisMoeda[i] != nil {
                    ret = troco.papeisMoeda[i]
                    troco.papeisMoeda[i] = nil
                }
                i += 1
            }
            return ret
        }

        func remove() {
            // Assim como no original, apenas chama next().
            _ = next()
        }
    }
}
