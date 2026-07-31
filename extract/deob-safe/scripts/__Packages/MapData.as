var §\x01§ = 571;
var §\x0f§ = 1;
class MapData
{
   var level0 = [];
   var level1 = [];
   var level2 = [];
   var level3 = [];
   var level4 = [];
   var level5 = [];
   var level6 = [];
   function MapData()
   {
      this.level0 = [];
      this.level1 = [];
      this.level2 = [];
      this.level3 = [];
      this.level4 = [];
      this.level5 = [];
      this.level6 = [];
      this.setMap();
   }
   function setMap()
   {
      this.level0.push([2,2,2]);
      this.level0.push([2,2,2,2,2]);
      this.level1.push([2,2,1,2,2]);
      this.level2.push([2,2,1,1,2,2]);
      this.level2.push([2,2,1,3,1,2,2]);
      this.level2.push([2,2,2,1,1,3,1,2,2,2]);
      this.level2.push([2,2,2,1,3,1,1,2,2,2]);
      this.level3.push([2,2,1,1,2,2]);
      this.level3.push([2,2,1,1,3,1,1,2,2,2]);
      this.level3.push([2,2,1,1,1,3,1,1,2,2]);
      this.level3.push([2,2,1,1,3,1,1,1,2,2]);
      this.level3.push([2,2,1,3,1,3,1,2,2,2]);
      this.level4.push([2,2,1,1,2,2]);
      this.level4.push([2,2,1,1,1,3,1,1,2,2]);
      this.level4.push([2,2,1,1,3,1,1,1,2,2]);
      this.level4.push([2,2,1,3,1,3,1,2,2,2]);
      this.level4.push([2,1,3,1,3,1,3,1,2,2]);
      this.level5.push([2,1,3,1,3,1,3,1,2,2]);
      this.level5.push([2,2,2,2,1,1,1,2,2,2]);
      this.level5.push([2,1,3,1,3,1,3,1,3,1]);
      this.level5.push([1,3,1,3,1,3,1,3,1,3]);
      this.level5.push([2,2,1,3,1,3,1,1,2,2]);
      this.level6.push([2,2,2,2,1,1,1,2,2,2]);
      this.level6.push([2,1,3,1,3,1,3,1,3,1]);
      this.level6.push([1,3,1,3,1,3,1,3,1,3]);
      this.level6.push([1,3,1,3,1,1,3,1,3,1]);
   }
   function getMap(level)
   {
      var _loc3_ = 0;
      var _loc4_ = [];
      var level = level + 1;
      if(level == 1)
      {
         _loc3_ = 75;
      }
      else if(level == 2)
      {
         _loc3_ = 50;
      }
      else if(level == 3)
      {
         _loc3_ = 40;
      }
      else if(level == 4)
      {
         _loc3_ = 10;
      }
      else if(level == 5)
      {
         _loc3_ = 30;
      }
      else if(level == 6)
      {
         _loc3_ = 0;
      }
      if(random(100) < _loc3_)
      {
         _loc4_ = this.level0[random(this.level0.length)];
      }
      else
      {
         _loc4_ = this["level" + level][random(this["level" + level].length)];
      }
      return _loc4_;
   }
}
