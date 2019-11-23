import Foundation

struct LoadMoreTableViewModel {
    
    public enum Row {
        case marvel(model: HeroMarvelModel)
        case dc(model:HeroDcModel)
        case movie(model: [HeroMovieModel])
    }
    
    private var mv: [HeroMovieModel] = []
    
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
    ] + [.movie(model: movieList)]
    
    mutating func replaceData(){
        self.mv = movieList
        movieList = self.mv + self.mv.prefix(5)
    }
    
}

var movieList: [HeroMovieModel] = [
       HeroMovieModel(id: "MO01", image: "Movie1"),
       HeroMovieModel(id: "MO01", image: "Movie2"),
       HeroMovieModel(id: "MO01", image: "Movie3"),
       HeroMovieModel(id: "MO01", image: "Movie4"),
       HeroMovieModel(id: "MO01", image: "Movie5"),
]
