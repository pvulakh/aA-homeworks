document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  const ctx = canvas.getContext('2d');

  ctx.fillStyle = 'green';
  ctx.fillRect(10, 10, 100, 100);

 ctx.beginPath();
 ctx.arc(200, 200, 50, 0, 2 * Math.PI);
 ctx.strokeStyle = 'blue';
 ctx.lineWidth = 1;
 ctx.stroke();
 
 ctx.fillStyle = "red";
 ctx.fill();
});
