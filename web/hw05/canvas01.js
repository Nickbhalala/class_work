function init () {
 let canvas = document.querySelector ("#canvas");
 let ctx = canvas.getContext ("2d");
 ctx.imageSmoothingEnabled = false;
 let width = canvas.width;
 let height = canvas.height;
 let imageData = ctx.createImageData (width, height);
 window.canvasCtx = ctx;
 window.canvasWidth = width;
 window.canvasHeight = height;
 window.canvasImageData = imageData;
 horizontalLine (150, 250, 150, 255, 0, 0);
 horizontalLine (150, 250, 250, 255, 0, 0);
 verticalLine (150, 150, 250, 255, 0, 0);
 verticalLine (250, 150, 250, 255, 0, 0);
}
function plotPixel (x, y, r, g, b) {
 let addr = 4 * (canvasWidth * y + x);
 canvasImageData.data[addr + 0] = r;
 canvasImageData.data[addr + 1] = g;
 canvasImageData.data[addr + 2] = b;
 canvasImageData.data[addr + 3] = 255; // always set alpha to 255 = 0xFF
 canvasCtx.putImageData (canvasImageData, 0, 0); // just for illustration!
}
function horizontalLine (minX, maxX, y, r, g, b) {
 for (let x = minX; x <= maxX; x++) {
 plotPixel (x, y, r, g, b);
 }
}
function verticalLine (x, minY, maxY, r, g, b){
 for(let y = minY; y<=maxY; y++){
 plotPixel(x, y, r, g, b);
}
}
