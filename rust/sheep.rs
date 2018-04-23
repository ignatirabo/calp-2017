#[allow(dead_code)]
struct Sheep { name: &'static str, naked: bool }

trait Animal {
    fn new(name: &'static str) -> Self;
    fn name(&self) -> &'static str;
}

impl Animal for Sheep {
    fn new(name: &'static str) -> Sheep {
        Sheep { name, naked: false}
    }

    fn name(&self) -> &'static str {
        self.name
    }
}

#[allow(unused_variables)]
fn main() {
    let d: Sheep = Animal::new("Dolly");
    {
        let mut p = d;
        p.name = "Polly";
        println!("Nombre p: {}", p.name)
    }
    // println!("Nombre d: {}", d.name)
}
