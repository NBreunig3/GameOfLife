/**
 Nathan Breunig
 Game Of Life Sim
 1/16/19
 **/
 
static int rows = 50; 
static int cols = 50;
static Cell[][] cells = new Cell[rows][cols]; //Array of "cells"
int gen = 0; //Generation counter

void setup() {
  background(0);
  size(1400, 800);
  stroke(130);
  frameRate(2);

  //Randomize the starting grid with alive and dead cells
  for (int row = 0; row < cells.length; row++) {
    for (int col = 0; col < cells[row].length; col++) {
      if (randomInt() < 4) {
        cells[row][col] = new Cell(row, col, false);
      } else if (randomInt() > 4) {
        cells[row][col] = new Cell(row, col, true);
      } else {
        //Why does this else ever run
        cells[row][col] = new Cell(row, col, false);
      }
    }
  }
}

void draw() {
  background(0);
  //display
  disp();
  //sim a generation
  sim();
  fill(255);
  textSize(25);
  text("Conway's Game Of Life Visualization by Nathan Breunig. 1/16/19. ", 10, 25);
  text("Generation: " + gen, 10, 60);
  gen++;
}

//Simulate the current generation by the rule of Conway's Game of Life
void sim() {
  Cell[][] cellsCopy = new Cell[cells.length][cells[0].length];
  //Initialize above array
  for (int row = 0; row < cells.length; row++) {
    for (int col = 0; col < cells[row].length; col++) {
      cellsCopy[row][col] = new Cell(row, col, false);
    }
  }

  //Rules of Game of Life
  for (int row = 0; row < cells.length; row++) {
    for (int col = 0; col < cells[row].length; col++) {
      Cell temp= cells[row][col];
      if (temp.isAlive() && temp.neighbors() < 2) {
        cellsCopy[row][col] = new Cell(row, col, false);
      } else if (temp.isAlive() && (temp.neighbors() == 2 || temp.neighbors() == 3)) {
        cellsCopy[row][col] = new Cell(row, col, true);
      } else if (temp.isAlive() && temp.neighbors() > 3) {
        cellsCopy[row][col] = new Cell(row, col, false);
      } else if (!temp.isAlive() && temp.neighbors() == 3) {
        cellsCopy[row][col] = new Cell(row, col, true);
      }
    }
  }
  cells = cellsCopy;
}

//Display the grid of cells
void disp() {
  for (int row = 0; row < cells.length; row++) {
    for (int col = 0; col < cells[row].length; col++) {
      Cell temp = cells[row][col];
      if (temp.isAlive()) {
        fill(255);
        rect(temp.x * (width/cells.length), temp.y * (height/cells[0].length), width/cells.length, height/cells[0].length);
      } else if (!temp.isAlive()) {
        fill(0);
        rect(temp.x * (width/cells.length), temp.y * (height/cells[0].length), width/cells.length, height/cells[0].length);
      }
    }
  }
}

//Random integer
int randomInt() {
  return (int)random(0, 10);
}
