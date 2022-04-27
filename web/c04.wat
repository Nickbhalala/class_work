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
 (func $calc_canvas_address (import "js" "calc_canvas_address") (param i32) (param i32) (result i32))
 (func $calc_artwork_address (import "js" "calc_artwork_address") (param i32) (param i32) (result i32))
 (func $clear_screen (import "js" "clear_screen") (param i32))
 (func $draw_image (import "js" "draw_image") (param i32) (param i32) (param i32) (param i32) (param i32))
 (func $draw_artwork (import "js" "draw_artwork") (param i32) (param i32) (param i32) (param i32) (param i32) (param i32))

 (func $draw_row_of_cherries (param $y i32)
    (local $count i32)
    (local.set $count (i32.const 0))
 )

 (func $step (export "step") (param $progress i32)
    (local $count i32)
    (local.set $count (i32.const 0))
    (call $clear_screen (i32.const 0xFF000000))

    block $done
      loop $repeat
        (br_if $done (i32.ge_u (local.get $count) (i32.const 32)))
        ;; (call $console_log (local.get $count))
        (call $draw_artwork
              (i32.const 488) ;; x coordinate in artwork
              (i32.const  48) ;; y coordinate in artwork
              (i32.const  16) ;; width of artwork to copy
              (i32.const  16) ;; height of artwork to copy
               ;; x coordinate to draw to in the HTML canvas
               ;; 0+$count*16
              (i32.add (i32.const 0) (i32.mul (local.get $count) (i32.const 16)))
              (i32.const  0) ;; y coordinate to draw to in the HTML canvas
        )        
        (local.set $count (i32.add (i32.const 1) (local.get $count)))
        br $repeat
      end $repeat
    end $done
    ;; C-M-k - kill forward by sexp
 )
)
