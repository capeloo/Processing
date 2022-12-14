//funcoes auxiliares
void mostraMapa() {
  for (int i=0; i<6; i++) {
    for (int j=0; j<6; j++) {
      switch(m[j][i]) {
      case 0:
        fill(0);
        stroke(255);
        rect(i*100, j*100, 100, 100);
        break;
      case 1:
        fill(255);
        stroke(0);
        rect(i*100, j*100, 100, 100);
        break;
      }
    }
  }
}

void colisao() {
  if (x < 0) {
    x = 0;
  } else if (x > 500) {
    x = 500;
  }
  if (y < 0) {
    y = 0;
  } else if (y > 500) {
    y = 500;
  }
}

void menu_batalha() {
  fill(0);
  rect(0, 500, 600, 100);
  stroke(255);
  rect(0, 500, 150, 100);
  fill(255);
  text("Tiamat", 10, 530);
  fill(0);
  rect(150, 450, 150, 150);
  rect(160, 460, 130, 30);
  fill(255);
  text("Attack", 197, 480);
  fill(0);
  rect(300, 500, 300, 100);
  fill(255);
  text("Char", 320, 530);
  text( vidaChar + "/100", 420, 530);
  text(manaChar, 550, 530);
}

void resolucao() {
  fill(0);
  text("Vitória", 280, height/2);
  text("Pressione enter para continuar", 175, 340);
}

int ataque(int forca, int defesa) {
  int dano = forca - defesa;
  return dano;
}

void mousePressed() {
  if (mouseX > 160 && mouseX < 290) {
    if (mouseY > 460 && mouseY < 490) {
      sword.play();
      vidaTiamat -= ataque(25, 0);
      estadoChar = atacar;
      estadoTiamat = atacado;
      fimDoTurno = true;
      println(vidaTiamat);
    }
  }
}

void batalha() {
  //char mef batalha
  if (estadoChar == esperar) {
    fill(0);
    rect(450, 150, 100, 100);
  } else if (estadoChar == atacar) {
    fill(0);
    rect(430, 150, 100, 100);
    tempo++;
    if (tempo == 20) {
      estadoChar = esperar;
      tempo = 0;
    }
  } else if (estadoChar == atacado) {
    fill(255, 0, 0);
    rect(450, 150, 100, 100);
    tempo++;
    if (tempo == 20) {
      estadoChar = esperar;
      tempo = 0;
    }
  }

  //vitoria
  if (vidaTiamat == 0) {
    eventoFinalizado = true;
    estado = resolucao;
  }

  //menu
  menu_batalha();

  //tiamat mef
  tiamat_mef();
}
