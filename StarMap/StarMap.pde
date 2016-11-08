/* Lab Test 1, Processing,
  Aaron Byrne, DT228/2, C15709609
  */
void setup()
{
  size(800,800);
}

void loadData()
{
  data.clear();
  
  Table t = loadTable("HabHYG15ly.csv", header);
  for(int i = 0 ; i < t.getRowCount(); i ++)
  {
    TableRow row = t.getRow(i);
    GDP gdp = new GDP(row);
    data.add(gdp);
  }
}
void draw()
{
}