(module
 (import "js" "memory" (memory 1))
 (import "js" "table" (table 1 funcref))
 (global $canvas_width (import "js" "canvas_width") (mut i32))
 (global $canvas_height (import "js" "canvas_height") (mut i32))
 (global $artwork_width (import "js" "artwork_width") (mut i32))
 (global $artwork_height (import "js" "artwork_height") (mut i32))
 (global $canvas_addr (import "js" "canvas_addr") (mut i32))
 (global $artwork_addr (import "js" "artwork_addr") (mut i32))
 (func $console_log (import "js" "console_log") (param i32))
 (func $error_out_of_bounds (import "js" "error_out_of_bounds") (param i32) (param i32) (param i32))
 (func $random (import "js" "random") (param i32) (result i32))

 (func $check_canvas_bounds (param $x i32) (param $y i32)
    (i32.or
       (i32.or
        (i32.lt_s (local.get $x) (i32.const 0))
        (i32.lt_s (local.get $y) (i32.const 0)))
       (i32.or
        (i32.ge_s (local.get $x) (global.get $canvas_width))
        (i32.ge_s (local.get $y) (global.get $canvas_height))))
    if
      (call $error_out_of_bounds (local.get $x) (local.get $y) (i32.const 0))
      unreachable
    end
 )

 (func $check_artwork_bounds (param $x i32) (param $y i32)
    (i32.or
       (i32.or
        (i32.lt_s (local.get $x) (i32.const 0))
        (i32.lt_s (local.get $y) (i32.const 0)))
       (i32.or
        (i32.ge_s (local.get $x) (global.get $artwork_width))
        (i32.ge_s (local.get $y) (global.get $artwork_height))))
    if
      (call $error_out_of_bounds (local.get $x) (local.get $y) (i32.const 1))
      unreachable
    end
 )

(func $calc_canvas_address (export "calc_canvas_address") (param $x i32) (param $y i32) (result i32)
   (call $check_canvas_bounds (local.get $x) (local.get $y))
   (i32.add (i32.mul (i32.add (i32.mul (local.get $y) (global.get $canvas_width)) (local.get $x)) (i32.const 4)) (global.get $canvas_addr))
 )

(func $calc_artwork_address (export "calc_artwork_address") (param $x i32) (param $y i32) (result i32)
   (call $check_artwork_bounds (local.get $x) (local.get $y))
   (i32.add (i32.mul (i32.add (i32.mul (local.get $y) (global.get $artwork_width)) (local.get $x)) (i32.const 4)) (global.get $artwork_addr))
 )

 ;; white = 0xFFFFFFFF
 (func $clear_screen (export "clear_screen") (param $color i32)
    (local $p i32)
    (local $counter i32)
    (local.set $counter (i32.mul (global.get $canvas_width) (global.get $canvas_height)))
    (local.set $p (global.get $canvas_addr))
    loop $repeat
      (i32.store (local.get $p) (local.get $color))
      (local.set $p (i32.add (local.get $p) (i32.const 4)))
      (local.set $counter (i32.add (local.get $counter) (i32.const -1)))
      (local.get $counter)
      br_if $repeat
    end $repeat
 )

 ;; Copies $len number of i32s (so 4 bytes at a time) from $src_addr to $dst_addr.
 ;; total bytes copied = 4 * $len
 (func $copy_i32s (param $src_addr i32) (param $dst_addr i32) (param $len i32)
   block $done
     loop $repeat
       (i32.eqz (local.get $len))
       br_if $done
       (i32.store (local.get $dst_addr) (i32.load (local.get $src_addr)))
       (local.set $src_addr (i32.add (local.get $src_addr) (i32.const 4)))
       (local.set $dst_addr (i32.add (local.get $dst_addr) (i32.const 4)))
       (local.set $len (i32.sub (local.get $len) (i32.const 1)))
       br $repeat
     end $repeat
   end $done
 )

 ;; Copies an image to the canvas memory.
 ;; Image should be stored with all its row consecutive in memory.
 ;; Note that this will not work for artwork containing multiple items in one image.  Use $draw_artwork instead.
 (func $draw_image (export "draw_image") (param $src_addr i32) (param $src_width i32) (param $src_height i32) (param $dst_x i32) (param $dst_y i32)
    (local $counter i32)
    (local.set $counter (i32.const 0))
    block $done
      loop $repeat
        (i32.ge_u (local.get $counter) (local.get $src_height))
        br_if $done
        (call $copy_i32s
              (local.get $src_addr)
              (call $calc_canvas_address (local.get $dst_x) (i32.add (local.get $dst_y) (local.get $counter)))
              (local.get $src_width))
        (local.set $src_addr (i32.add (local.get $src_addr) (i32.mul (local.get $src_width) (i32.const 4))))        
        (local.set $counter (i32.add (local.get $counter) (i32.const 1)))
        br $repeat
      end $repeat
    end $done
 )

 (func $draw_artwork (export "draw_artwork")
       (param $src_x i32) (param $src_y i32) (param $src_width i32) (param $src_height i32)
       (param $dst_x i32) (param $dst_y i32)
    (local $counter i32)
    (local.set $counter (i32.const 0))
    (call $check_artwork_bounds (local.get $src_x) (local.get $src_y))
    (call $check_artwork_bounds
          (i32.sub (i32.add (local.get $src_x) (local.get $src_width)) (i32.const 1))
          (i32.sub (i32.add (local.get $src_y) (local.get $src_height)) (i32.const 1)))
    (call $check_canvas_bounds  (local.get $dst_x) (local.get $dst_y))
    (call $check_canvas_bounds
          (i32.sub (i32.add (local.get $dst_x) (local.get $src_width)) (i32.const 1))
          (i32.sub (i32.add (local.get $dst_y) (local.get $src_height)) (i32.const 1)))
    block $done
      loop $repeat
        (i32.ge_u (local.get $counter) (local.get $src_height))
        br_if $done
        (call $copy_i32s
              (call $calc_artwork_address (local.get $src_x) (i32.add (local.get $src_y) (local.get $counter)))
              (call $calc_canvas_address  (local.get $dst_x) (i32.add (local.get $dst_y) (local.get $counter)))
              (local.get $src_width))
        (local.set $counter (i32.add (local.get $counter) (i32.const 1)))
        br $repeat
      end $repeat
    end $done
 )
)