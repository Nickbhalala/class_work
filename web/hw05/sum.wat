;; sums numbers in an array of *bytes*

(module
 (func $console_log (import "imports" "console_log") (param i32))
 (memory (export "memory") 1)
 (func $sum_array (export "sum_array") (param $start i32) (param $len i32) (result i32)
   (local $index i32)
   (local $total i32)

   i32.const 0
   local.set $index

   i32.const 0
   local.set $total

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
)