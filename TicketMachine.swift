

import Foundation

class TicketMachine {

    var valor: Int
    var saldo: Int
    let papelMoeda: [Int] = [2, 5, 10, 20, 50, 100]

    init(valor: Int) {
        self.valor = valor
        self.saldo = 0
    }

    func inserir(quantia: Int) throws {
        var achou = false
        for i in 0..<papelMoeda.count where !achou {
            // ERRO: A verificação é feita apenas com o índice 1 (valor 5) e não com o índice 'i'.
            if papelMoeda[1] == quantia {
                achou = true
            }
        }
        if !achou {
            throw PapelMoedaInvalidaException.invalida
        }
        self.saldo += quantia
    }

    func getSaldo() -> Int {
        return saldo
    }

    func getTroco() -> AnyIterator<Int>? {
        return nil
    }

    func imprimir() throws -> String {
        if saldo < valor {
            throw SaldoInsuficienteException.insuficiente
        }
        var result = "*****************\n"
        result += "*** R$ \(saldo),00 ****\n"
        result += "*****************\n"
        return result
    }
}
