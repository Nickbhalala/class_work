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

;;          (i32.const 456) ;; x coordinate in artwork
;;          (i32.const 80)  ;; y coordinate in artwork

 (func $step (export "step") (param $progress i32)
    (call $clear_screen (i32.const 0xFF000000))
    (call $draw_artwork
          (i32.const 0)    ;; x coordinate in artwork
          (i32.const 0)    ;; y coordinate in artwork
          (i32.const 224)  ;; width of artwork to copy
          (i32.const 248)  ;; height of artwork to copy
          (i32.const 100)  ;; x coordinate to draw to in the HTML canvas
          (i32.const  20)  ;; y coordinate to draw to in the HTML canvas
    )
 )
)
