import gleam/io

import gleam/erlang/process
import gleam/option.{None}
import glisten

pub fn main() {
  // Ensures gleam doesn't complain about unused imports in stage 1 (feel free to remove this!)
  let _ = glisten.new
  let _ = glisten.start
  let _ = glisten.continue
  let _ = process.sleep_forever
  let _ = None

  let assert Ok(_) =
    glisten.new(fn(_conn) { #(Nil, None) }, fn(state, _msg, _conn) {
      io.println("Received message!")
      glisten.continue(state)
    })
    |> glisten.start(4221)

  process.sleep_forever()
}
