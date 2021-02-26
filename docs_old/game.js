console.log("Start of game.js");

const STATE_PLAYING = "__PLAYING__";

current_state = STATE_PLAYING;


/*
function loop(timestamp) {
    var elapsed_time = timestamp - lastRender;
  
    if (current_state == STATE_PLAYING) {
    } else {
      console.error("Invalid current state: " + current_state);
    }
  
    lastRender = timestamp;
    window.requestAnimationFrame(loop);
  }

  lastRender = 0
window.requestAnimationFrame(loop)
*/

var session = pl.create();

console.log("End of game.js");
