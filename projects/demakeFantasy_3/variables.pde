import processing.sound.*;
SoundFile prelude;
SoundFile village;
SoundFile battle;
SoundFile sword;
SoundFile victory;

PImage [] gif1, gif2, gif3, gif4;

PImage grass, tree, window, window2, door, fence, hp,
  rip, flowers, lake, inn, wall, wall2, floor, hole,
  roof, roof2, roof3, crest, shield, logo, bridge, column;
  
int x = 240;
int y = 384;
int tempo = 0;

int vidaChar = 100;
int manaChar = 50;

int vidaTiamat = 50;

int nFrames = 2;
int frame;

boolean evento = true;
boolean andar = false;

//estados possíveis
int telaInicial = 0;
int mapa1 = 1;
int mapa2 = 2;
int mapa3 = 3;
int batalha = 4;
int resolucao = 5;

//estados iniciais
int estadoMapa = telaInicial;

int [][] m1 = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8},
  {1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 9, 1, 6, 6, 6, 6, 1, 7, 7, 7, 7, 7},
  {1, 9, 1, 5, 5, 5, 5, 1, 7, 1, 12, 12, 12},
  {1, 9, 1, 2, 2, 4, 2, 1, 7, 1, 12, 12, 12},
  {1, 9, 1, 2, 2, 3, 2, 1, 7, 1, 12, 12, 12},
  {1, 9, 1, 11, 11, 7, 11, 1, 7, 1, 12, 12, 12},
  {1, 9, 1, 10, 10, 7, 10, 1, 7, 1, 11, 11, 11},
  {1, 9, 1, 1, 1, 7, 7, 7, 7, 7, 7, 7, 7},
  {1, 8, 8, 8, 8, 8, 8, 8, 7, 8, 8, 8, 8},
  {1, 1, 0, 0, 0, 0, 1, 11, 7, 11, 1, 1, 1},
};

int [][] m2 = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 1},
  {1, 1, 1, 1, 1, 6, 6, 6, 15, 15, 15, 9, 1},
  {7, 7, 7, 7, 7, 14, 13, 14, 11, 11, 15, 9, 1},
  {12, 12, 12, 1, 7, 2, 3, 2, 15, 15, 11, 9, 1},
  {12, 12, 12, 1, 7, 7, 7, 7, 10, 10, 10, 9, 0},
  {12, 12, 12, 1, 6, 6, 6, 7, 6, 6, 6, 9, 0},
  {12, 12, 12, 1, 5, 18, 5, 7, 5, 16, 5, 9, 1},
  {11, 11, 11, 1, 17, 3, 17, 7, 17, 3, 17, 9, 0},
  {7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 9, 1},
  {8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 1},
  {0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1},
};

int [][] m3 = {
  {1, 1, 0, 0, 1, 1, 1, 11, 7, 11, 1, 1, 1},
  {1, 1, 1, 1, 0, 1, 1, 11, 7, 11, 1, 1, 1},
  {1, 1, 0, 0, 1, 1, 1, 10, 7, 10, 1, 1, 1},
  {12, 12, 12, 12, 12, 12, 12, 12, 19, 12, 12, 12, 12},
  {12, 12, 12, 12, 12, 12, 12, 12, 19, 12, 12, 12, 12},
  {1, 1, 1, 1, 1, 1, 1, 10, 7, 10, 1, 1, 1},
  {1, 20, 0, 1, 0, 0, 0, 0, 7, 0, 0, 1, 1},
  {1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1},
  {1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1},
  {1, 1, 0, 1, 1, 1, 21, 0, 0, 1, 1, 0, 1},
  {1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
  {1, 1, 1, 1, 1, 1, 21, 1, 1, 0, 0, 1, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
};