fn main() {
    let mut s = String::from("Hello, world!");
    {
        let hello = &s[0..5];
        let world = &s[7..12];
        println!("{}", hello);
        println!("{}", world);
    }
    s.clear()
}
