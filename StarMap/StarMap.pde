/* Lab Test 1, Processing,
  Aaron Byrne, DT228/2, C15709609
  */
void setup()
{
  size(800,800);
  loadData();
}

// Global Arraylist of star objects
ArrayList<Star> star = new ArrayList<Star>();

void loadData()
{
  star.clear();
  
  Table t = loadTable("HabHYG15ly.csv", "header");
  for(int i = 0 ; i < t.getRowCount(); i ++)
  {
    TableRow row = t.getRow(i);
    Star insert = new Star(row);
    star.add(insert);
    
  }
}
void draw()
{
  
println(star);
}