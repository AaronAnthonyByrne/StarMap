class Star
{
  int hab;
  String DisplayName;
  float Distance;
  float Xg, Yg,Zg;
  float AbsMag;
  
   Star(String line)
  {
    String[] fields = line.split(",");
    DisplayName = fields[3];
    hab = Integer.parseInt(fields[2]);
    Distance = Float.parseFloat(fields[12]);
    Xg = Float.parseFloat(fields[13]);
    Yg = Float.parseFloat(fields[14]);
    Zg = Float.parseFloat(fields[15]);
    AbsMag = Float.parseFloat(fields[16]);
  }
  
  Star(TableRow row)
  {
    hab= row.getInt(2);
    DisplayName = row.getString(3);
    Distance = row.getFloat(12);
    Xg = row.getFloat(13);
    Yg = row.getFloat(14); 
    Zg = row.getFloat(15); 
    AbsMag = row.getFloat(16); 
  }


}