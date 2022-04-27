(module
 (func $console_log (import "imports" "console_log") (param i32))
 (memory (export "memory") 1)
 (func $fill_mem (export "fill_mem") (result  i32)
   (local $index i32)
   (local $start i32)

   i32.const 0
   local.set $start

   i32.const 0
   local.set $index

   block $done
     loop $repeat
       local.get $index
       i32.const 16
       i32.ge_s
       br_if $done

       local.get $start
       local.get $index
       i32.add
       i32.const 0xFF
       i32.store8

       local.get $index
       i32.const 1
       i32.add
       local.set $index

       br $repeat
     end $repeat
   end $done
   i32.const 0
 )
)