/* Lab Test 1, Processing,
 Aaron Byrne, DT228/2, C15709609
 */
void setup()
{
  size(800, 800);
  background(0);
  loadData();
  printStars();
}

// Global Arraylist of star objects
ArrayList<Star> star = new ArrayList<Star>();
int border = 50;



void loadData()
{
  star.clear();

  Table t = loadTable("HabHYG15ly.csv", "header");
  for (int i = 0; i < t.getRowCount(); i ++)
  {
    TableRow row = t.getRow(i);
    Star insert = new Star(row);
    star.add(insert);
  }
}

void printStars()
{
  for (Star e : star)
  {
    println(e);
  }
}

void drawGrid()
{
  int row =11;
  int col =11;
  float cellW, cellH;
  cellW = width / col;
  cellH = height / row;
  int parsec=-5;
  for (int y = border; y < height-border; y += cellH)
  {
    for (int x = border; x < width-border; x += cellW)
    {
      noFill();
      stroke(128, 0, 128);
      rect(x, y, cellW, cellH);
      fill(128, 0, 128);
       
    }
    text(parsec, border-15, y+10);
    text(parsec, y,border );
    parsec++;
  }
  text(parsec, height-border,border );
  text(parsec,border,height-border );
}

void plotStars()
{
  
  for (int i = 0; i < star.size(); i++) 
  {
    
    float plotx = map(star.get(i).Xg, -5, 5, border, width-border);
    float ploty = map(star.get(i).Yg, -5, 5, 0, height-border);
    
    fill(255,0,0);
    ellipse(plotx,ploty,5,5);
  }
 // Xg = row.getFloat(13);
   // Yg = row.getFloat(14);
  
}

void draw()
{
  drawGrid();
  plotStars();
}