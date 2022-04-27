;; calculates factorial 5 and returns it

(module
 (func $console_log (import "imports" "console_log") (param i32))
 (memory (export "memory") 1)
 (func $run (export "run") (result i32)
   (local $counter i32)
   (local $result i32)

   i32.const 5
   local.set $counter

   i32.const 1
   local.set $result

   block $done
     loop $repeat

       local.get $counter
       i32.eqz
       br_if $done

       local.get $counter
       local.get $result
       i32.mul
       local.set $result

       local.get $counter
       i32.const -1
       i32.add
       local.set $counter

       br $repeat
     end $repeat
   end $done

   local.get $result
 )
)