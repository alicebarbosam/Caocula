import Foundation

enum Porte: String, CaseIterable{
    case pequeno = "Pequeno"
    case medio = "Média"
    case grande = "Grande"
    
    func conversaoDeIdade(anos: Int, meses: Int) -> Int{
        let result: Int
        let multiplicador: Int
        switch self{
        case .pequeno:
            multiplicador = 6
        case .medio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
        result = anos * multiplicador + meses * multiplicador / 12
        return result
    }
    
}
