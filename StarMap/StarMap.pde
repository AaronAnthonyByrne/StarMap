/* Lab Test 1, Processing,
 Aaron Byrne, DT228/2, C15709609
 */
void setup()
{
  size(800, 600);
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
void draw()
{
  int row =10;
  int col =10;
  float cellW, cellH;
  cellW = width / col;
  cellH = height / row;
  for (int y = border; y < height-border; y += cellH)
  {
    for (int x = border; x < width-border; x += cellW)
    {
      noFill();
      stroke(50, 0, 100);
      rect(x, y, cellW, cellH);
      text(" parasec", x,y);
    }
  }
}