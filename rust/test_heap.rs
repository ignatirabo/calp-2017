fn main () {
    let a = Box::new(String::new());
    let r_of_box : &Box<String> = &a;

    let r1 : &String = &*a;
    let r2 : &String = &a;
}
