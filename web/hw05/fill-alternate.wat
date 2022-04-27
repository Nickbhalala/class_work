(module
 (func $console_log (import "imports" "console_log") (param i32))
 (memory (export "memory") 13)
 (func $step (export "step") (param $progress i32)
    (local $pixel i32)
    (local $max i32)

    i32.const 0xC3FFF
    local.set $max
    i32.const 0x10000
    local.set $pixel

    block $done
    loop $repeat

      local.get $pixel
      i32.const 0xFF0000FF   ;; red
      i32.store

      local.get $pixel
      i32.const 4
      i32.add
      local.tee $pixel
      local.get $max
      i32.ge_u
      br_if $done

      local.get $pixel
      i32.const 0xFFFF0000 ;; blue
      i32.store

      local.get $pixel
      i32.const 4
      i32.add
      local.tee $pixel
      local.get $max
      i32.ge_u
      br_if $done

     br $repeat
    end $repeat
    end $done
 )
)