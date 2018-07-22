
document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("mycanvas");
  canvasEl.width = 800;
  canvasEl.height = 800;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "blue";
  ctx.fillRect(0, 0, 1000, 500);

  ctx.beginPath();
  ctx.arc(200, 100, 100, 0, 2*Math.PI, true);
  ctx.strokeStyle = "gold";
  ctx.lineWidth = 20;
  ctx.stroke();
  ctx.fillStyle = "red";
  ctx.fill();
});
