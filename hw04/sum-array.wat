;; sums numbers in an array of *bytes* of fixed length
(module
 (import "" "write_i32"  (func $write_i32  (param i32)))
 (import "" "write_i32x" (func $write_i32x (param i32)))
 (import "" "write_i32b" (func $write_i32b (param i32)))
 (import "" "write_char" (func $write_char (param i32)))
 (memory (export "memory") 1)
 ;;(data (offset (i32.const 0)) "\01\02\03\04\05\06\07\08\09\0a")

 (func $sum_array (param $start i32)(result i32)
   (local $index i32)
   (local $total i32)
   (local $len i32)
   i32.const 0
   local.set $index

   i32.const 0
   local.set $total
   local.get $index
   i32.load8_u
   local.set  $len
   block $done
     loop $repeat
       local.get $index
       local.get $len
       i32.ge_s
       br_if $done
       local.get $start
       local.get $index
       i32.add
       i32.load8_u
       local.get $total
       i32.add
       local.set $total

       local.get $index
       i32.const 1
       i32.add
       local.set $index      
       br $repeat
     end $repeat
   end $done
   local.get $total
 )
 (func $run (export "run") (result i32)
   ;; the data begins at address 16 in memory
   i32.const 0
   call $sum_array
) 
)