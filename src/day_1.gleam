import gleam/io
import gleam/int
import gleam/result
import gleam/order
import gleam/string
import gleam/list
import gleam/erlang/file

pub fn sum_elf(elf) {
  try ints = result.all(list.map(elf, int.parse))
  Ok(list.fold(ints, 0, int.add))
}

pub fn get_elf_stats(elf_sums) {
  let sorted_elves =
    list.sort(
      elf_sums,
      fn(val1, val2) { order.reverse(int.compare(val1, val2)) },
    )

  case sorted_elves {
    [e1, e2, e3, ..] -> Ok(#(e1, e1 + e2 + e3))
    _ -> Error("Not enough elves")
  }
}

pub fn main() {
  assert Ok(contents) = file.read("input")

  // Each elf is separated by a blank line, AKA 2 new lines in sequence
  let elves = string.split(contents, on: "\n\n")

  try elf_sums =
    result.all(list.map(elves, fn(elf) { sum_elf(string.split(elf, on: "\n")) }))

  assert Ok(#(max1, max3)) = get_elf_stats(elf_sums)

  io.println("Largest Value: " <> int.to_string(max1))
  io.println("Top 3 elves: " <> int.to_string(max3))

  Ok(0)
}
