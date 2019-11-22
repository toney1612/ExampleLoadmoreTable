import Foundation

struct LoadMoreTableViewModel {
    
    public enum Row {
        case marvel(model: HeroMarvelModel)
        case dc(model:HeroDcModel)
    }
    
    var dataSouce: [Row] = [
        .dc(model: HeroDcModel(id: "DC01", name: "Batman")),
        .dc(model: HeroDcModel(id: "DC02", name: "Wonder Woman")),
        .dc(model: HeroDcModel(id: "DC03", name: "Superman")),
        .dc(model: HeroDcModel(id: "DC04", name: "Joker")),
        .dc(model: HeroDcModel(id: "DC05", name: "Aquaman")),
        .marvel(model: HeroMarvelModel(id: "ML01", name: "Captain America")),
        .marvel(model: HeroMarvelModel(id: "ML01", name: "Spiderman")),
        .marvel(model: HeroMarvelModel(id: "ML01", name: "IronMan")),
        .marvel(model: HeroMarvelModel(id: "ML01", name: "Thor")),
        .marvel(model: HeroMarvelModel(id: "ML01", name: "AntMan")),
        .dc(model: HeroDcModel(id: "DC01", name: "Batman")),
        .dc(model: HeroDcModel(id: "DC02", name: "Wonder Woman")),
        .dc(model: HeroDcModel(id: "DC03", name: "Superman")),
        .dc(model: HeroDcModel(id: "DC04", name: "Joker")),
        .dc(model: HeroDcModel(id: "DC05", name: "Aquaman")),
        .marvel(model: HeroMarvelModel(id: "ML01", name: "Captain America")),
        .marvel(model: HeroMarvelModel(id: "ML01", name: "Spiderman")),
        .marvel(model: HeroMarvelModel(id: "ML01", name: "IronMan")),
        .marvel(model: HeroMarvelModel(id: "ML01", name: "Thor")),
        .marvel(model: HeroMarvelModel(id: "ML01", name: "AntMan")),
    ].shuffled()
    
    mutating func replaceData(){
        self.dataSouce = self.dataSouce + self.dataSouce.prefix(10)
    }
    
}
