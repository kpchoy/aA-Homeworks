document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("mycanvas");
  canvasEl.width = 800;
  canvasEl.height = 800;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "blue";
  ctx.fillRect(0, 0, 1000, 500);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "gold";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "blue";
  ctx.fill();
});
