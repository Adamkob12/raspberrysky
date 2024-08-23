fn main() {
    println!("cargo:rustc-link-arg-bin=raspberrysky=--script=kernel.ld");
}
