float gravity = 9.80665;
float ballX;
float ballY;
float Yvelocity = 0;
float Xvelocity = 0;
float ballDIM = 20;

float mouseXdif;
float mouseYdif;

void setup() {
  frameRate(60);
  fullScreen();
  ballX = width/2;
  ballY = height / 2;
}

void draw() {
  background(40);
  //Move Ball with mouse
  if (mousePressed) {
    ballX = constrain(mouseX, 0 + ballDIM/2, width - ballDIM /2);
    ballY = constrain(mouseY, 0 + ballDIM/2, height - ballDIM /2);
    mouseXdif = mouseX - pmouseX;
    mouseYdif = mouseY - pmouseY;
    println(mouseYdif);
    println(mouseYdif);

    Xvelocity = mouseXdif;
    Yvelocity = mouseYdif;
  }
  //Move ball then update velocity
  ballY += Yvelocity;
  ballX += Xvelocity;
  Yvelocity += gravity / 60;

  //Constrain Values
  if (ballY > height - ballDIM / 2) { 
    Yvelocity = Yvelocity * -0.2;
    Xvelocity = Xvelocity * 0.8;
    ballY = height - ballDIM/2;
  } else if (ballY < 0 + ballDIM/2) {
    ballY = 0 + ballDIM/2;
    Yvelocity = Yvelocity * -0.2;
    Xvelocity = Xvelocity * 0.8;
  }
  if (ballX < 0 + ballDIM/2) {
    Xvelocity = Xvelocity * -0.2;
    Yvelocity = Yvelocity * 0.5;
    ballX = 0 + ballDIM/2;
  } else if (ballX > width - ballDIM/2) {
    Xvelocity = Xvelocity * -0.2;
    Yvelocity = Yvelocity * 0.5;
    ballX = width - ballDIM/2;
  }

  //Finally draw ball
  ellipse(ballX, ballY, ballDIM, ballDIM);
}