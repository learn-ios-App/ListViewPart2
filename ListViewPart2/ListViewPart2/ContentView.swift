import SwiftUI


struct ContentView: View {
    @State var animalName = ""
    @State var animal:[Animal] = [
        Animal(name: "ライオン", check: true),
        Animal(name: "ハイエナ", check: true)
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("肉食動物")) {
                    ForEach(animal) { index in
                        Text(index.name)
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    index.check = false
                                    deletaAnimal()
                                } label: {
                                    Image(systemName: "trash.fill")
                                }
                            }
                    }
                    TextField("動物の種類を記入してください", text: $animalName,
                              onCommit: {
                        self.addAnimal()
                        DispatchQueue.main.async {
                            animalName = ""
                        }

                    })
                }

            }
            .navigationTitle(Text("動物"))
        }
    }
    func addAnimal() {
        let newAnimal = Animal(name: self.animalName, check: true)
        self.animal.insert(newAnimal, at: 0)
        self.animalName = ""
    }
    func deletaAnimal() {
        let necessaryAnimal =
        self.animal.filter({$0.check})
        self.animal = necessaryAnimal
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
