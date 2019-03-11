document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  const ctx = canvas.getContext('2d');

  //rectangle
  ctx.fillStyle = 'green';
  ctx.fillRect(10, 10, 100, 100);

  //circle
  ctx.beginPath();
  ctx.arc(200, 200, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'blue';
  ctx.lineWidth = 1;
  ctx.stroke();
  
  //fill circle 
  ctx.fillStyle = "red";
  ctx.fill();
  
  //triangles
  ctx.fillStyle = "maroon";
  ctx.beginPath();
  ctx.moveTo(300, 300);
  ctx.lineTo(350, 350);
  ctx.lineTo(400, 300);
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(320, 320);
  ctx.lineTo(370, 370);
  ctx.lineTo(420, 320);
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(280, 320);
  ctx.lineTo(330, 370);
  ctx.lineTo(380, 320);
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(325, 300);
  ctx.lineTo(350, 275);
  ctx.lineTo(375, 300);
  ctx.fill();
});
