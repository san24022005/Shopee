function startCountdown() {
  function updateCountdown() {
    var now = new Date();

    // Tính mốc 00:00 ngày mai
    var target = new Date();
    target.setHours(24, 0, 0, 0); // 24h00m00s

    var diff = target - now; // ms còn lại

    if (diff <= 0) {
      // Hết giờ, reset về 24h
      target.setDate(target.getDate() + 1);
      diff = target - now;
    }

    var hours = Math.floor(diff / (1000 * 60 * 60));
    var minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((diff % (1000 * 60)) / 1000);

    document.getElementById("hours").innerHTML = hours.toString().padStart(2, '0');
    document.getElementById("minutes").innerHTML = minutes.toString().padStart(2, '0');
    document.getElementById("seconds").innerHTML = seconds.toString().padStart(2, '0');
  }

  updateCountdown();
  setInterval(updateCountdown, 1000);
}

startCountdown();
