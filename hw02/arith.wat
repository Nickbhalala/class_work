(module
 (import "" "write_i32"  (func $write_i32  (param i32)))
 (func $run (export "run") (result i32)
   ;; stack = []         (empty)
   i32.const 10
   i32.const 3
   i32.const 1
   i32.sub
   i32.div_s
   i32.const 2
   i32.const 4
   i32.add
   i32.const 6
   i32.mul
   i32.add

 )
)
