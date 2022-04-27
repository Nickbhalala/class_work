;; sums numbers in an array of *bytes* of fixed length
(module
 (import "" "write_i32"  (func $write_i32  (param i32)))
 (import "" "write_i32x" (func $write_i32x (param i32)))
 (import "" "write_i32b" (func $write_i32b (param i32)))
 (import "" "write_char" (func $write_char (param i32)))
 (memory (export "memory") 1)
 ;;(data (offset (i32.const 16)) "\01\09\02\07\05\03\04\0a\06\08")
  (func $max_array (param $start i32)(param $len i32)  (result i32)
   (local $index i32)
   (local $counter i32)
   (local $n i32)
   (local $address i32)
   i32.const 0
   local.set $index
   i32.const 0
  local.set $counter  
   local.get $index
    i32.load8_u
    local.set $n
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
      local.set $address
       local.get $address
       local.get $n
       i32.eq
       if
       local.get $counter
       i32.const  1
       i32.add
       local.set $counter
       end
       local.get $index
       i32.const 1
       i32.add
       local.set $index
       br $repeat
     end $repeat
   end $done

   local.get $counter
 )
 (func $run (export "run") (result i32)
   ;; the data begins at address 16 in memory
   i32.const 1
   i32.const 159
   ;; the data is stored in 10 bytes
   
   call $max_array
 )
)