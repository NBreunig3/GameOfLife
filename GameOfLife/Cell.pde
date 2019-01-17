public class Cell {
  int x, y;
  boolean alive;

  public Cell(int x, int y, boolean alive) {
    this.x = x;
    this.y = y;
    this.alive = alive;
  }

  //Returns the number of neighbors a specific cell has
  public int neighbors() {
    //Above: [x][y-1]
    //Below: [x][y+1]
    //Right: [x+1][y]
    //Left:  [x-1][y]
    //Top Left:     [x-1][y-1]
    //Top Right:    [x+1][y-1]
    //Bottom Left:  [x-1][y+1]
    //Bottom Right: [x+1][y+1]


    int count = 0;
    Cell[][] temp = sketch_GameOfLife.cells;

    //NOTE: Terrible way to do this.
    //TODO: Refactor with for loops
    //CORNER CASES
    if (x == 0 && y== 0) {
      //TOP LEFT CORNER
      //Below
      if (temp[x][y+1].isAlive()) {
        count++;
      }
      //Right
      if (temp[x+1][y].isAlive()) {
        count++;
      }
      //Bottom Right
      if (temp[x+1][y+1].isAlive()) {
        count++;
      }
    } else if (x == 0 && y == rows - 1) {
      //BOTTOM LEFT CORNER
      //Above
      if (temp[x][y-1].isAlive()) {
        count++;
      }
      //Right
      if (temp[x+1][y].isAlive()) {
        count++;
      }
      //Top Right
      if (temp[x+1][y-1].isAlive()) {
        count++;
      }
    } else if (x == cols - 1 && y == 0) {
      //TOP RIGHT CORNER
      //Below
      if (temp[x][y+1].isAlive()) {
        count++;
      }
      //Left
      if (temp[x-1][y].isAlive()) {
        count++;
      }
      //Bottom Left
      if (temp[x-1][y+1].isAlive()) {
        count++;
      }
    } else if (x == cols - 1 && y == rows - 1) {
      //BOTTOM RIGHT CORNER
      //Above
      if (temp[x][y-1].isAlive()) {
        count++;
      }
      //Left
      if (temp[x-1][y].isAlive()) {
        count++;
      }
      //Top Left
      if (temp[x-1][y-1].isAlive()) {
        count++;
      }
    }

    //EDGES
    else if (y == 0) {
      //TOP EDGE
      //Below
      if (temp[x][y+1].isAlive()) {
        count++;
      }
      //Right
      if (temp[x+1][y].isAlive()) {
        count++;
      }
      //Left
      if (temp[x-1][y].isAlive()) {
        count++;
      }
      //Bottom Left
      if (temp[x-1][y+1].isAlive()) {
        count++;
      }
      //Bottom Right
      if (temp[x+1][y+1].isAlive()) {
        count++;
      }
    } else if (x == 0) {
      //LEFT EDGE
      //Above
      if (temp[x][y-1].isAlive()) {
        count++;
      }
      //Below
      if (temp[x][y+1].isAlive()) {
        count++;
      }
      //Right
      if (temp[x+1][y].isAlive()) {
        count++;
      }
      //Top Right
      if (temp[x+1][y-1].isAlive()) {
        count++;
      }
      //Bottom Right
      if (temp[x+1][y+1].isAlive()) {
        count++;
      }
    } else if (y == sketch_GameOfLife.cols - 1) {
      //BOTTOM EDGE
      //Above
      if (temp[x][y-1].isAlive()) {
        count++;
      }
      //Right
      if (temp[x+1][y].isAlive()) {
        count++;
      }
      //Left
      if (temp[x-1][y].isAlive()) {
        count++;
      }
      //Top Left
      if (temp[x-1][y-1].isAlive()) {
        count++;
      }
      //Top Right
      if (temp[x+1][y-1].isAlive()) {
        count++;
      }
    } else if (x == sketch_GameOfLife.rows - 1) {
      //RIGHT EDGE
      //Above
      if (temp[x][y-1].isAlive()) {
        count++;
      }
      //Below
      if (temp[x][y+1].isAlive()) {
        count++;
      }
      //Left
      if (temp[x-1][y].isAlive()) {
        count++;
      }
      //Top Left
      if (temp[x-1][y-1].isAlive()) {
        count++;
      }
      //Bottom Left
      if (temp[x-1][y+1].isAlive()) {
        count++;
      }
    }

    //OTHERWISE NOT A SPECIAL CASE
    else {
      //CHECK ALL
      //Above
      if (temp[x][y-1].isAlive()) {
        count++;
      }
      //Below
      if (temp[x][y+1].isAlive()) {
        count++;
      }
      //Right
      if (temp[x+1][y].isAlive()) {
        count++;
      }
      //Left
      if (temp[x-1][y].isAlive()) {
        count++;
      }
      //Top Left
      if (temp[x-1][y-1].isAlive()) {
        count++;
      }
      //Top Right
      if (temp[x+1][y-1].isAlive()) {
        count++;
      }
      //Bottom Left
      if (temp[x-1][y+1].isAlive()) {
        count++;
      }
      //Bottom Right
      if (temp[x+1][y+1].isAlive()) {
        count++;
      }
    }
    return count;
  }

  public boolean isAlive() {
    return alive;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }
}
