;; Move a pacman ghost around the screen by cursor keys.
;; Counts from 0..63 and uses counter/8 to pick one of the 8 images of the ghost from the artwork.

;; store x at address 0x200
;; store y at address 0x204
;; store ghost state counter at address 0x208

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

 (func $add_to_x (param $n i32)
    (i32.store (i32.const 0x200) (i32.add (i32.load (i32.const 0x200)) (local.get $n)))
 )
 (func $add_to_y (param $n i32)
    (i32.store (i32.const 0x204) (i32.add (i32.load (i32.const 0x204)) (local.get $n)))
 )
 (func $step (export "step") (param $progress i32)
    (local $y i32)

    (i32.load8_u (i32.const 37)) ;; left
    if
      (call $add_to_x (i32.const -2))
    end

    (i32.load8_u (i32.const 38)) ;; up
    if
      (call $add_to_y (i32.const -2))
    end

    (i32.load8_u (i32.const 39)) ;; right
    if
      (call $add_to_x (i32.const 2))
    end

    (i32.load8_u (i32.const 40)) ;; down
    if
      (call $add_to_y (i32.const 2))
    end

    (call $clear_screen (i32.const 0xFF000000))

    (call $draw_artwork
          (i32.add (i32.const 456) (i32.mul (i32.const 0x10) (i32.div_u (i32.load (i32.const 0x208)) (i32.const 8))))
          (i32.const 0x40)
          (i32.const 16)
          (i32.const 16)
          (i32.load (i32.const 0x200))
          (i32.load (i32.const 0x204))
    )

    (i32.store (i32.const 0x208) (i32.add (i32.load (i32.const 0x208)) (i32.const 1)))
    (i32.ge_s (i32.load (i32.const 0x208)) (i32.const 64))
    if
      (i32.store (i32.const 0x208) (i32.const 0))
    end
 )
)