#![allow(non_snake_case)]
use pyo3::prelude::*;
use rand::Rng;

#[pyfunction]
fn random_number(min: u32, max: u32) -> PyResult<String> {
    let mut rng = rand::thread_rng();
    let num :u32 = rng.gen_range(min..=max);
    Ok(num.to_string())
}
/// A Python module implemented in Rust. The name of this function must match
/// the `lib.name` setting in the `Cargo.toml`, else Python will not be able to
/// import the module.
#[pymodule]
fn helper_robot(_py: Python, m: &PyModule) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(random_number, m)?)?;
    Ok(())
}