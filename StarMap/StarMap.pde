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
float border = 50;



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
  //could've done a for each loop.
  /*
  for(TableRow row:t.rows());
  {
    Star s = new Star(row);
    stars.add(s);
  }
  */
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
  for (float y = border; y < height-border; y += cellH)
  {
    for (float x = border; x < width-border; x += cellW)
    {
      noFill();
      stroke(128, 0, 128);
      rect(x, y, cellW, cellH);
      fill(128, 0, 128);
    }
    text(parsec, border-15, y+10);
    text(parsec, y, border );
    parsec++;
  }
  text(parsec, height-border, border );
  text(parsec, border, height-border );
  
  /* 
  Bryans solution
  for (float x = -5; x<=5; x++)
  {
    float lx = map(x,-5,5,border,width-border);
    line(lx,0,lx,height-border);
    text((int)x,lx,10);
      }
      for (float y = -5; y<=5; y++)
  {
    float ly = map(x,-5,5,border,height-border);
    line(border,ly,width-border,ly);
    text((int)y,ly,10);
    
  }
  */
}

void plotStars()
{

  for (int i = 0; i < star.size(); i++) 
  {

    float plotx = map(star.get(i).Xg, -5, 5, border, width-border);
    float ploty = map(star.get(i).Yg, -5, 5, 0, height-border);

    stroke(0, 255, 255);
    line(plotx, ploty+2, plotx, ploty-2);
    line(plotx+2, ploty, plotx-2, ploty);

    noFill();
    stroke(255, 0, 0);
    ellipse(plotx, ploty, star.get(i).AbsMag, star.get(i).AbsMag);

    textAlign(LEFT,CENTER);
    text(star.get(i).DisplayName , plotx, ploty);
    
    if (mouseX >= plotx && mouseX <= ploty)
    {      
      stroke(255, 0, 0);
      fill(255, 0, 0);
    } 
  }
  // Xg = row.getFloat(13);
  // Yg = row.getFloat(14);
}

void draw()
{
  drawGrid();
  plotStars();
}