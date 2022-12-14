import gleeunit
import gleeunit/should
import day_1

pub fn main() {
  gleeunit.main()
}

pub fn sum_test_test() {
  day_1.sum_elf(["1", "2", "3"])
  |> should.equal(Ok(6))
}

pub fn stats_test() {
  day_1.get_elf_stats([2, 4, 6, 8, 10, 3, 7])
  |> should.equal(Ok(#(10, 25)))
}
