

(module
 (import "" "write_i32"  (func $write_i32  (param i32)))
 (import "" "write_i32x" (func $write_i32x (param i32)))
 (import "" "write_i32b" (func $write_i32b (param i32)))
 (import "" "write_char" (func $write_char (param i32)))
 (func $run (export "run") (result i32)
   (local $counter i32)
   i32.const 10
   local.set $counter
   loop $repeat
  local.get $counter
  call $write_i32
  i32.const 10
  call $write_char
  local.get $counter
  i32.const -1
  i32.add
  local.set $counter
  local.get $counter
  br_if $repeat
 
   end $repeat
   i32.const 42
 )
)